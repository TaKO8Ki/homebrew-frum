class Gobang < Formula
  desc "Cross-platform TUI database management tool written in Rust"
  homepage "https://github.com/TaKO8Ki/gobang"
  version "0.1.0-alpha.5"
  license "MIT"

  if OS.mac?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "36679a7dac88788ad951ebdcdc9be304865a43c3ef2af0362dcb1984d2fde13a"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "29b8f517937cf19691c6e594a0789fe80a528fff05c346883af0e2950b9b90ef"
  end

  def install
    bin.install "gobang"
  end

  test do
    system("#{bin}/gobang", "-h")
  end
end
