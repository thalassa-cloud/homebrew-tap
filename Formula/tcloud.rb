# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.20.3"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.3/tcloud_0.20.3_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "140b55c56594f98386829624379e3ccd831210e7cf53160062f2a558301a429f"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.3/tcloud_0.20.3_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "7bd570a945f79cbd824e84a6f4a7bb15563e907139ca57241b789af1d7b59b05"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.3/tcloud_0.20.3_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "d9e28980c2d6548524c52e8f7f81b27fcc54b08e1e0a4385bc4e6845ed002e0b"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.3/tcloud_0.20.3_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "c6a25418af058a62734f31e853380f0680a37a91e5947613591cf16408210a91"
  
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
  
