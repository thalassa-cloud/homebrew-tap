# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.20.5"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.5/tcloud_0.20.5_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "1ce23edb7ec378e1f28270c96190822c816f2881d6654ebf46b7c2c5e7c00de0"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.5/tcloud_0.20.5_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "47ba6571cdac8b3b79bc5097a313561df62b56c544d25298930c0289e563a016"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.5/tcloud_0.20.5_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "5c5fcbfdcbfd8d5f6bdbcc9aeadb48d206b0cc95c61c2265260382dce156810c"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.5/tcloud_0.20.5_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "20d708ee74a4d28e3d6e26f0452bc1ad72452d01c2c19741f07e4957473cfb5d"
  
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
  
