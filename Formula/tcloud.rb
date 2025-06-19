# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.4.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.4.0/tcloud_0.4.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "ed88894ed4e5e4218b89457b350ac23021e7e26e2a770cf24a66cc8b45d89bb4"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.4.0/tcloud_0.4.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "4f5a7b3eee9df33ae4a25dd0dccd54f16b61e4b4adf7b5991888405d5a077765"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.4.0/tcloud_0.4.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "e1a371dccd8383ca552d3506a582da31812fbc73809e76355867a5ab0a878ab2"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.4.0/tcloud_0.4.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "20620c48e4e0c65368cd62921202c656f957f865721f905b47537d1c05ea51d0"
  
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
  
