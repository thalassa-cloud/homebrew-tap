# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.7.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.7.0/tcloud_0.7.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "c309c7d7c1ed67b26a80128f4a409c8bdd94f578b66f6bc439273d146d5d4899"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.7.0/tcloud_0.7.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "de45f92265d18d697345eba3c3382eaee0b0c0fe466bbc6033523fb13e93907e"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.7.0/tcloud_0.7.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "d8dc3aec43d5316031d940c71c9279514a4882627610af9fd5725a05ff6c120f"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.7.0/tcloud_0.7.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "8cae5b974ffe5f9e634b94d1975600b3912ac079331684711330b55c918ab960"
  
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
  
