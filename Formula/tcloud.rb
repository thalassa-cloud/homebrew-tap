# typed: false
# frozen_string_literal: true

class Tcloud < Formula
    desc "Thalassa Cloud CLI"
    homepage "https://github.com/thalassa-cloud/tcloud"
    version "0.16.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.16.0/tcloud_0.16.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "cf75e9207f9948636a4cb73cc8274edac3a723c7e326867d4af9187ef86120f3"
  
        def install
          bin.install "tcloud"
          zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
          bash_completion.install "completions/tcloud.bash" => "tcloud"
          fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.16.0/tcloud_0.16.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "1a1196d40331b296dbf3c73044fa8b8e499d588a70454b7dd72dc0c99ae7c77f"
  
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
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.16.0/tcloud_0.16.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "3bcaf52d320ec0531973f6acba2cafd163ac5ba1cbf3551e597a3484b8ad958f"
  
        def install
            bin.install "tcloud"
            zsh_completion.install "completions/tcloud.zsh" => "_tcloud"
            bash_completion.install "completions/tcloud.bash" => "tcloud"
            fish_completion.install "completions/tcloud.fish"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/thalassa-cloud/cli/releases/download/v0.16.0/tcloud_0.16.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "3e89e3e3563a04c5e8c1362acb3f18051575f3b9f48fb3e1cf890e9a1690d14c"
  
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
  
