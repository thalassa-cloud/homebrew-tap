# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.2.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.2.0/tcloud_0.2.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "a3763ae5fa58e8064bcb1c5b606ceed68c42c67b1e6fee518e1968cfd184c0e8"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.2.0/tcloud_0.2.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "f5ccb992f523c17acc9dffd0ee22d6572ab2f754d277e13ff1b89027cf0bcb8e"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.2.0/tcloud_0.2.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "8057b24406c9172d801a35c32a8b7ca53ddc38916c9ad1fac5344cd1432bb0a9"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.2.0/tcloud_0.2.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "4fb78ed6d19a1beb12f4864b408351066a9ca358419c948c814d408f69e7449f"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
    end
  
    depends_on "zsh" => :optional
    depends_on "fnf" => :optional
  
    test do
      system "#{bin}/tcloud version"
    end
  end
  
