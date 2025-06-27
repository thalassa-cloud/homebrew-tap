# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.5.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.5.0/tcloud_0.5.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "5b0a455b9208baea57caecc812dd11cf05c2ba5f5580a10279b2728628652bcb"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.5.0/tcloud_0.5.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "5d10ac5f5c35550d5c67475a2a7f35f7745ceac03ea5ef9861d15358a917a5be"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.5.0/tcloud_0.5.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "0f6e030ffb5b9cae537978f1d4bb41d73f06013014447c4172d3ac711bde773f"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.5.0/tcloud_0.5.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "03e503243d973ebd50aea39080d4c42d98b536eee13fe1de890d7a8b24a8dc17"
  
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
  
