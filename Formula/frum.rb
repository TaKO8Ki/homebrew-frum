class Frum < Formula
  desc "Slightly fast and modern Ruby version manager written in Rust"
  homepage "https://github.com/TaKO8Ki/frum"
  version "0.1.0-beta0"
  license "MIT"
  head "https://github.com/TaKO8Ki/frum.git"
  url_version = "0.1.0-beta.0"

  if OS.mac?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{url_version}/frum-v#{url_version}-x86_64-apple-darwin.tar.gz"
    sha256 "6b26c75c351c19d748451f316e264d79a6423e242f812b493419e8cab1b1ac91"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{url_version}/frum-v#{url_version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e9c2d21ffdff08a0d965d5f813245ba6d0a05590037dc67d30a98354639f60d0"
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
