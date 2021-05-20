class Frum < Formula
  desc "Slightly fast and modern Ruby version manager written in Rust"
  homepage "https://github.com/TaKO8Ki/frum"
  version "0.1.0"
  license "MIT"
  head "https://github.com/TaKO8Ki/frum.git"

  if OS.mac?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{version}/frum-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "f6aad22a8916e9a3a12ed3bd77f47eb08ac6575e7f6146bef36318157e24fb98"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/frum/releases/download/v#{version}/frum-v#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "993d676523135e2a01b304f6bc21828f231e845e10ce03f3af32bbfd1acfc8d4"
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
