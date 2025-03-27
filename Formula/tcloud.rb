# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.0.2"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.2/tcloud_0.0.2_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "2fad1ace757192970739306ab84ebe94fa1972036d339f441502edf26c0aba9e"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.2/tcloud_0.0.2_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "c1d4fe5ae38de679cc2818d69b6703acb6640f9fa38429246fd147b460786801"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.2/tcloud_0.0.2_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "12a96a2d5a029ed138d4192247c184e1414728cb82a669cc08ecb7365b7614a6"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.0.2/tcloud_0.0.2_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "de84b719a119fe5c0f34fab3be4b86fe5c7baecfa376bad136ef34b7bdbd6d63"
  
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
  
