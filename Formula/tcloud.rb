# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.0.3"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.3/tcloud_0.0.3_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "c649a98a80a4cd0cd68fc4f98b4108b3b36789f6a05ce279890254a38e5f4405"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.3/tcloud_0.0.3_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "03ee85fb920be6c95a02b840dc5f03c438b59dade33d33814917cc35266c0ab4"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.3/tcloud_0.0.3_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "c353b44a1003c55ed01bea827ef6a6c267ebd12a5d81a0e5c82a7b222f7b9f3d"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.3/tcloud_0.0.3_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "09ee6f4a41c25ef7d12c22a38c27e9e2d034a0b190635195d2d3c1ccca61d56d"
  
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
  
