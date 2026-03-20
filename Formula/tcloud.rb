# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.17.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.17.0/tcloud_0.17.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "7b758ed0f24b3de4b1831fc93ffba9e158654cb7554016d79c5996f7c3019e60"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.17.0/tcloud_0.17.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "f93fa3ef71ea900309891b507753f2b6fc55fb429bc551622e5ebe56a808bf7a"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.17.0/tcloud_0.17.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "a6914bc56208db18673161d71dc094e14f23497ef9e2442d1387458c694246f2"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.17.0/tcloud_0.17.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "f1566ad93a024e5b3a8c72e6b3a0333173482ab2aad7cc8f317fc997fed9fa0d"
  
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
  
