class Frum < Formula
  desc "A little bit fast and modern Ruby version manager written in Rust"
  homepage "https://github.com/TaKO8Ki/frum"
  url "https://github.com/TaKO8Ki/frum/archive/v0.1.0-alpha.0.tar.gz"
  sha256 "5f2aa0f1fea5ffe780f86232edec9af3946d0b0540ad68a377387712ab24f11c"
  license "MIT"
  head "https://github.com/TaKO8Ki/frum.git"

  livecheck do
    url "https://github.com/TaKO8Ki/frum/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args

    (bash_completion/"frum").write Utils.safe_popen_read("#{bin}/frum", "completions", "--shell=bash")
    (zsh_completion/"frum").write Utils.safe_popen_read("#{bin}/frum", "completions", "--shell=zsh")
  end

  test do
    system("#{bin}/frum", "install", "2.6.5")
    assert_match "", shell_output("#{bin}/frum local 2.6.5")
  end
end
