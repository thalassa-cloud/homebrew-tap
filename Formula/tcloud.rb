# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.11.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.11.0/tcloud_0.11.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "3777113d1e397ec618c8ae0e5e2a14528f29466d27fc4f440725a939c6a68ed5"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.11.0/tcloud_0.11.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "3fd3cf17386a97777e242fddadd15ac244839c3256841c36da3ec4d3e823c289"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.11.0/tcloud_0.11.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "6a254b3623fca527bf43bce50e19e163094f0a3ffb690f734abd04cbe1e78103"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.11.0/tcloud_0.11.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "262ff0affdec932167685619f64adc5c019910ba099b672bbb8448c739dcbfed"
  
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
  
