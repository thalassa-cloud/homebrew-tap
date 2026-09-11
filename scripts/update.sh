#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
FORMULA_FILE="$REPO_ROOT/Formula/tcloud.rb"

# GitHub repository
GITHUB_REPO="thalassa-cloud/cli"
GITHUB_API="https://api.github.com/repos/${GITHUB_REPO}"

echo -e "${GREEN}Fetching latest release information...${NC}"

# Get the latest release tag from GitHub API
LATEST_TAG=$(curl -s "${GITHUB_API}/releases/latest" | grep -o '"tag_name": "[^"]*' | grep -o '[^"]*$' || echo "")

if [[ -z "$LATEST_TAG" ]]; then
    echo -e "${YELLOW}Warning: Could not fetch latest release tag from GitHub API, using /latest/download endpoint${NC}"
    LATEST_TAG="latest"
else
    # Remove 'v' prefix if present
    LATEST_TAG="${LATEST_TAG#v}"
    echo -e "${GREEN}Latest release: v${LATEST_TAG}${NC}"
fi

# Download checksums.txt from the GitHub Releases page
CHECKSUMS_FILE=$(mktemp -t tcloud-checksums-XXXXXX.txt)
trap "rm -f $CHECKSUMS_FILE" EXIT

echo -e "${GREEN}Downloading checksums file...${NC}"
if ! curl -L -f -s -o "$CHECKSUMS_FILE" "https://github.com/${GITHUB_REPO}/releases/latest/download/checksums.txt"; then
    echo -e "${RED}Error: Failed to download checksums file from GitHub${NC}" >&2
    exit 1
fi

# Check if checksums file exists and has content
if [[ ! -f "$CHECKSUMS_FILE" ]] || [[ ! -s "$CHECKSUMS_FILE" ]]; then
    echo -e "${RED}Error: Downloaded checksums file is empty or missing${NC}" >&2
    exit 1
fi

# Check if formula file exists
if [[ ! -f "$FORMULA_FILE" ]]; then
    echo -e "${RED}Error: formula file not found at $FORMULA_FILE${NC}" >&2
    exit 1
fi

# Parse checksums file and extract version and hashes
VERSION=""
DARWIN_ARM64_HASH=""
DARWIN_AMD64_HASH=""
LINUX_ARM64_HASH=""
LINUX_AMD64_HASH=""

while IFS= read -r line; do
    # Skip empty lines
    [[ -z "$line" ]] && continue
    
    # Extract hash and filename
    read -r hash filename <<< "$line"
    
    # Extract version from filename (format: tcloud_VERSION_OS_ARCH.tar.gz)
    if [[ -z "$VERSION" ]]; then
        if [[ "$filename" =~ tcloud_([0-9]+\.[0-9]+\.[0-9]+)_ ]]; then
            VERSION="${BASH_REMATCH[1]}"
        else
            echo -e "${RED}Error: Could not extract version from filename: $filename${NC}" >&2
            exit 1
        fi
    fi
    
    # Extract platform from filename and store hash
    if [[ "$filename" =~ _(darwin|linux|windows)_(amd64|arm64)\.tar\.gz$ ]]; then
        os="${BASH_REMATCH[1]}"
        arch="${BASH_REMATCH[2]}"
        platform="${os}_${arch}"
        
        case "$platform" in
            darwin_arm64)
                DARWIN_ARM64_HASH="$hash"
                ;;
            darwin_amd64)
                DARWIN_AMD64_HASH="$hash"
                ;;
            linux_arm64)
                LINUX_ARM64_HASH="$hash"
                ;;
            linux_amd64)
                LINUX_AMD64_HASH="$hash"
                ;;
        esac
    else
        echo -e "${YELLOW}Warning: Could not parse platform from filename: $filename${NC}" >&2
    fi
done < "$CHECKSUMS_FILE"

# Validate we have the required hashes
if [[ -z "$DARWIN_ARM64_HASH" ]] || [[ -z "$DARWIN_AMD64_HASH" ]] || \
   [[ -z "$LINUX_ARM64_HASH" ]] || [[ -z "$LINUX_AMD64_HASH" ]]; then
    echo -e "${RED}Error: Missing required hash(es)${NC}" >&2
    [[ -z "$DARWIN_ARM64_HASH" ]] && echo -e "${RED}  Missing: darwin_arm64${NC}" >&2
    [[ -z "$DARWIN_AMD64_HASH" ]] && echo -e "${RED}  Missing: darwin_amd64${NC}" >&2
    [[ -z "$LINUX_ARM64_HASH" ]] && echo -e "${RED}  Missing: linux_arm64${NC}" >&2
    [[ -z "$LINUX_AMD64_HASH" ]] && echo -e "${RED}  Missing: linux_amd64${NC}" >&2
    exit 1
fi

if [[ -z "$VERSION" ]]; then
    echo -e "${RED}Error: Could not determine version from checksums file${NC}" >&2
    exit 1
fi

# Verify version matches latest release (if we fetched it)
if [[ "$LATEST_TAG" != "latest" ]] && [[ "$LATEST_TAG" != "$VERSION" ]]; then
    echo -e "${YELLOW}Warning: Version from checksums ($VERSION) does not match latest release tag ($LATEST_TAG)${NC}"
    echo -e "${YELLOW}Proceeding with version from checksums file: $VERSION${NC}"
fi

# Check current version in formula
CURRENT_VERSION=$(grep -E '^\s*version\s+"' "$FORMULA_FILE" | sed -E 's/.*version\s+"([^"]+)".*/\1/' || echo "")

if [[ -n "$CURRENT_VERSION" ]]; then
    if [[ "$CURRENT_VERSION" == "$VERSION" ]]; then
        echo -e "${YELLOW}Formula is already at version $VERSION${NC}"
        echo -e "${YELLOW}Checking if hashes need updating...${NC}"
    else
        echo -e "${GREEN}Updating formula from version $CURRENT_VERSION to $VERSION${NC}"
    fi
else
    echo -e "${GREEN}Updating formula to version $VERSION${NC}"
fi

# Create a temporary file for the updated formula
TEMP_FILE=$(mktemp)
trap "rm -f $TEMP_FILE $CHECKSUMS_FILE" EXIT

# Update the formula file
awk -v version="$VERSION" \
    -v darwin_arm64_hash="$DARWIN_ARM64_HASH" \
    -v darwin_amd64_hash="$DARWIN_AMD64_HASH" \
    -v linux_arm64_hash="$LINUX_ARM64_HASH" \
    -v linux_amd64_hash="$LINUX_AMD64_HASH" \
    '
    BEGIN {
        current_platform = ""
    }
    
    # Update version line
    /^[[:space:]]*version[[:space:]]+"/ {
        sub(/"[^"]*"/, "\"" version "\"")
    }
    
    # Detect platform from URL line and update URL
    /darwin_arm64\.tar\.gz/ {
        current_platform = "darwin_arm64"
        sub(/v[0-9]+\.[0-9]+\.[0-9]+/, "v" version)
        sub(/tcloud_[0-9]+\.[0-9]+\.[0-9]+/, "tcloud_" version)
    }
    /darwin_amd64\.tar\.gz/ {
        current_platform = "darwin_amd64"
        sub(/v[0-9]+\.[0-9]+\.[0-9]+/, "v" version)
        sub(/tcloud_[0-9]+\.[0-9]+\.[0-9]+/, "tcloud_" version)
    }
    /linux_arm64\.tar\.gz/ {
        current_platform = "linux_arm64"
        sub(/v[0-9]+\.[0-9]+\.[0-9]+/, "v" version)
        sub(/tcloud_[0-9]+\.[0-9]+\.[0-9]+/, "tcloud_" version)
    }
    /linux_amd64\.tar\.gz/ {
        current_platform = "linux_amd64"
        sub(/v[0-9]+\.[0-9]+\.[0-9]+/, "v" version)
        sub(/tcloud_[0-9]+\.[0-9]+\.[0-9]+/, "tcloud_" version)
    }
    
    # Update SHA256 hash based on current platform
    /^[[:space:]]*sha256[[:space:]]+"/ {
        if (current_platform == "darwin_arm64") {
            sub(/"[^"]*"/, "\"" darwin_arm64_hash "\"")
        } else if (current_platform == "darwin_amd64") {
            sub(/"[^"]*"/, "\"" darwin_amd64_hash "\"")
        } else if (current_platform == "linux_arm64") {
            sub(/"[^"]*"/, "\"" linux_arm64_hash "\"")
        } else if (current_platform == "linux_amd64") {
            sub(/"[^"]*"/, "\"" linux_amd64_hash "\"")
        }
        current_platform = ""  # Reset after processing hash
    }
    
    {
        print
    }
    ' "$FORMULA_FILE" > "$TEMP_FILE"

# Replace the original file
mv "$TEMP_FILE" "$FORMULA_FILE"

echo -e "${GREEN}Successfully updated formula to version $VERSION${NC}"
echo -e "${GREEN}Updated hashes:${NC}"
echo -e "  darwin_arm64: $DARWIN_ARM64_HASH"
echo -e "  darwin_amd64: $DARWIN_AMD64_HASH"
echo -e "  linux_arm64:  $LINUX_ARM64_HASH"
echo -e "  linux_amd64:  $LINUX_AMD64_HASH"

# commit and push the changes
# check if there are any changes
if git diff --quiet "$FORMULA_FILE"; then
    echo -e "${GREEN}No changes to commit${NC}"
    exit 0
fi

echo -e "${GREEN}Committing and pushing changes...${NC}"
git add "$FORMULA_FILE"
git commit -m "Update tcloud formula to version $VERSION"
git push origin main
echo -e "${GREEN}Changes pushed successfully${NC}"
