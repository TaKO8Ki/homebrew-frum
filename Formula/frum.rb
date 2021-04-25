class Frum < Formula
  desc "Slightly fast and modern Ruby version manager written in Rust"
  homepage "https://github.com/TaKO8Ki/frum"
  version "0.1.0-alpha1"
  license "MIT"
  head "https://github.com/TaKO8Ki/frum.git"
  url_version = "0.1.0-alpha.1"

  if OS.mac?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{url_version}/frum-v#{url_version}-x86_64-apple-darwin.tar.gz"
    sha256 "96406f3ae74ef0ef5359055fd5eff3291037aa3b0667e110b22e2fd8ad6ba1a2"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{url_version}/frum-v#{url_version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "82530f26be8113c7dd1a43398ea2f45c1e06d4e1c0af203a236d81145015112c"
  end

  livecheck do
    url "https://github.com/TaKO8Ki/frum/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  def install
    bin.install "frum"

    (bash_completion/"frum").write Utils.safe_popen_read("#{bin}/frum", "completions", "--shell=bash")
    (zsh_completion/"_frum").write Utils.safe_popen_read("#{bin}/frum", "completions", "--shell=zsh")
  end

  test do
    system("#{bin}/frum", "install", "2.6.5")
    assert_match "", shell_output("#{bin}/frum local 2.6.5")
  end
end
