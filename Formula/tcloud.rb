# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.20.2"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.2/tcloud_0.20.2_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "fa02d84f84e67997b412cd743459d39500899c6be64210d685472a497cf9b417"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.2/tcloud_0.20.2_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "451de67b85f71997273a4e4f496d07ba6db79afb664619654b902e470e35f327"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.2/tcloud_0.20.2_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "267eae9fadcc076c094bcc57fcd267484e7e71edf0d0f4dc3604fb36ad3d6895"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.2/tcloud_0.20.2_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "99ad5f82752d25b7433119c97fedb60419f0450678e1ec4e2b99d2ed741adb9f"
  
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
  
