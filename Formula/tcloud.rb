# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.22.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.22.0/tcloud_0.22.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "b86d68edbbb2c73df6a0d0b912fb01b415006d9cea6c2eeaa78c611e7d1050f1"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.22.0/tcloud_0.22.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "399b4cb3716d19297e8793bf1b1087383a53da66e74c35fef046e9ae4b8dfdfd"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.22.0/tcloud_0.22.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "0329ed81cad9dc8f1f546e3417c09763edb178670ca10348992f57905f6ff4a3"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.22.0/tcloud_0.22.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "d03953a1c1423dbe82c572cf05a3c6ae960bd4ef85cec8dee73eceffcc8fabcd"
  
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
  
