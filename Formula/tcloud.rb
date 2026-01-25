# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.14.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.14.0/tcloud_0.14.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "35db888d0b88d10539e0a43028bba3bc2c8e6dd7a80fdb374539366469ab25b5"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.14.0/tcloud_0.14.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "c24988bc347273a11f0171c4b2042b4e3f82ac16765fec3e6f6e0152a576b1ff"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.14.0/tcloud_0.14.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "164432eaeba629936f8b7c330974d32320b20c03f50d4ec5f5a0a254191f140e"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.14.0/tcloud_0.14.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "b5eb68d29f295736e90f2ca702969fda6cbcf8c5813e530fdf9afdd0c9104f39"
  
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
  
