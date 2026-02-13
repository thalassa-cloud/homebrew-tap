# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.15.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.15.0/tcloud_0.15.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "b088427a88fdf3b29e90e9b1e40900e9486942d1bc838a89ebfe6209096e2590"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.15.0/tcloud_0.15.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "2e92ad77c8592bdb15d4de830345ff78bb7928c55ec79bfafef8c66139d932c6"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.15.0/tcloud_0.15.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "8d68380d4976ea892348373dce7e6c455d7df8ecf9673f3f63a89fb4f94e2726"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.15.0/tcloud_0.15.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "2ff8468a7c19ebab2c2d457d9f5f44c33d726d7698f617502a351edf60a40f35"
  
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
  
