# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.0.1"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/tcloud/releases/download/v0.0.1/tcloud_0.0.1_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "94d79459a644dfff626366567cd2688ec25f5245b592fedff519ca623d7ec3e9"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/tcloud/releases/download/v0.0.1/tcloud_0.0.1_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "bc9dcad6e86a84d97398aacae1388e1d8aaf369324de46a1f27b4ab6f6d5e31e"
  
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
        url "https://github.com/thalassa-cloud/tcloud/releases/download/v0.0.1/tcloud_0.0.1_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "7ac1fb7734b37ec548190bf82b19ca29a0511a6c536b4bf75698b978beb306bb"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/tcloud/releases/download/v0.0.1/tcloud_0.0.1_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "0cb3c817452e8b564fc3366a42a6213e09efb63ff8759de10172defcffe76ff6"
  
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
  
