# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.20.7"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.7/tcloud_0.20.7_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "a6073a6580c7c10dd26d0f5facf707cc163fbadcd212c1ecdc1a8ecc2b5ecfe0"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.7/tcloud_0.20.7_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "7f2536013f408ed285c9b270b3149b2a317fc7f64df748b15727b4ca4bebdbca"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.7/tcloud_0.20.7_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "11bf5661f8db26f32862e62a8228456adf9ec9d2fd57fb9d553cdd36fa45f626"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.20.7/tcloud_0.20.7_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "0d8616f67ab6b5d200997f68184859c33448eec074934b8b018afeb364b37f63"
  
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
  
