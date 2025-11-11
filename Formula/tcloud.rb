# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.9.1"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.9.1/tcloud_0.9.1_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "269fb42aa9a28f95635ff801486415cb1a9674b795af4c3a9a25204383a8a671"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.9.1/tcloud_0.9.1_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "c3266fc767c491748af526717ded2d35da04e2e65f31c65338be87151488693e"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.9.1/tcloud_0.9.1_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "360b3c5c11e87a411afde0300d681bd6f83e971b3be85b4fd1098ae5ac9f034e"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.9.1/tcloud_0.9.1_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "f3985bddc8972a91dd691699f4cf07ad427f7ae0c79dc169d3488f71ea46429c"
  
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
  
