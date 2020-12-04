# This file was generated by GoReleaser. DO NOT EDIT.
class Ecctl < Formula
  desc "Elastic Cloud Control, the official Elastic Cloud and ECE command line interface"
  homepage "https://github.com/elastic/ecctl"
  version "1.1.0"

  if OS.mac?
    url "https://download.elastic.co/downloads/ecctl/1.1.0/ecctl_1.1.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
    sha256 "6fd2a0f5b67cae58fc4ca7deeecd23c725cca5662deae8eaf64583dcff0230ac"
  elsif OS.linux?
    url "https://download.elastic.co/downloads/ecctl/1.1.0/ecctl_1.1.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
    sha256 "9667d7279800fbacf68623cbfeba5e6b04b770a4b47aaaca7bdf02554e55712e"
  end

  def install
    bin.install "ecctl"
    system "#{bin}/ecctl", "generate", "completions", "-l", "#{var}/ecctl.auto"
  end

  def caveats; <<~EOS
    To get autocompletions working make sure to run "source <(ecctl generate completions)".
    If you prefer to add to your shell interpreter configuration file run, for bash or zsh respectively:
    * `echo "source <(ecctl generate completions)" >> ~/.bash_profile`
    * `echo "source <(ecctl generate completions)" >> ~/.zshrc`.
  EOS
  end

  test do
    system "#{bin}/ecctl version"
  end
end
