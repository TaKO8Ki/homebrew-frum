class Frum < Formula
  desc "Slightly fast and modern Ruby version manager written in Rust"
  homepage "https://github.com/TaKO8Ki/frum"
  version "0.1.0-alpha.0"
  license "MIT"
  head "https://github.com/TaKO8Ki/frum.git"

  if OS.mac?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{version}/frum-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "57ab2eff76ac54049e7537c730eb62271258ee5646d6ff2a821ff44943ffa415"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{version}/frum-v#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a495ddf28e9cc7da20b9f823eff8cfa7248dc992a247ca5fb5c369cf5c8027ce"
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
