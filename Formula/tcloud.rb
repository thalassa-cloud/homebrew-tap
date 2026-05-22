# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.18.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.18.0/tcloud_0.18.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "199442bb664bb2924c95624f091d5fa4b1dea5f89eb67144a991dcfe1baa8961"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.18.0/tcloud_0.18.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "726483d293f6ab89bd25e5032fa81a11b3a1647622dc36a23f36cb5d0f964986"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.18.0/tcloud_0.18.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "4d6977ff56f1d31e3ff302b7a01441d82b2b88a833d562e08099eba2b0defca7"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.18.0/tcloud_0.18.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "8e5bdef82d23822cbf1a6e1f65035309a52c018fd3dd79bf5707ea6e89e144ee"
  
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
  
