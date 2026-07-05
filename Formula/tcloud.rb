# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.20.1"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.1/tcloud_0.20.1_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "7bdf22e0bb6f01ddee8a169621e8e837b88a8afc6ec82330d4d71795725f39c2"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.1/tcloud_0.20.1_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "2e4e30f31e88cfb6b908a4bbe829198e89a5e310e5b2f60f1a77b7e6333e5825"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.1/tcloud_0.20.1_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "b99a609f3d387a1beec386f3f8cd96ac965493504c89bc0eb3ee7598cad44c75"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.1/tcloud_0.20.1_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "ee0bfdd036f8ab3aae0fcca3823308847e1ae50064f40a9de6796e2d43962a29"
  
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
  
