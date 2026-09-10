# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.21.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.21.0/tcloud_0.21.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "168faddaf9dcfd4ba02768dedd4407351e8c5ff9b6d3055acf42b87e1907f25f"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.21.0/tcloud_0.21.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "d4064e4ff51eba3d6c218b21bac89880bbdc451bc1181d76494fcf965d4416d9"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.21.0/tcloud_0.21.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "4e91f5c68cf1b4c28ec46bcb9deb516a1d7986f7e09a2386ef55e6b1587c3bfd"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.21.0/tcloud_0.21.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "132aac3c4007a1a15628759ebd4bc63cc666d9c76b2ff1063ed7fd210459e2ae"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
    end
  
    depends_on "zsh" => :optional
    depends_on "fzf" => :optional
  
    test do
      system "#{bin}/tcloud version"
    end
  end
  
