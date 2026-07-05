# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.20.4"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.4/tcloud_0.20.4_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "b8adcf35b78cf8f25ebf929f9550fe6028678b3f29db69512eab5ee673686e03"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.4/tcloud_0.20.4_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "a4784320256b2958a7169264719590e14c599dc954b9c43b48bd7138d080b73f"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.4/tcloud_0.20.4_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "66ddc0673e8ff62923bb726404fc27860c60d7f03ec275f0349f1b3b4f756030"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.4/tcloud_0.20.4_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "b1045e9a6eafd39efd3b7d34a90e9cca0a922b13456cad0041044e0952faa392"
  
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
  
