# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.12.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.12.0/tcloud_0.12.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "cc553c127cef2758f2cb1f8453feef0edbfd09efe9f5e77e8954297c3a599aaf"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.12.0/tcloud_0.12.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "e3de46ae4dcea39a462518253ec893df02d349150cb01dba5a48d97ac7eb1a40"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.12.0/tcloud_0.12.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "30c71eccfdd1e72f4cb9972d3d250e4042593e879ece3818482ca6561aa2e1bb"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.12.0/tcloud_0.12.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "0fe63f951543ad8d88b50349e8fed7e874256995d0f5f5dc4ae831b69cd53a86"
  
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
  
