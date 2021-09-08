class Gobang < Formula
  desc "Cross-platform TUI database management tool written in Rust"
  homepage "https://github.com/TaKO8Ki/gobang"
  version "0.1.0-alpha.3"
  license "MIT"

  if OS.mac?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "3d157b976a8bf60089f325a94bf4efbd9b8a7c5c97a166425698454f645c0ca2"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3004bef9dd14a7810ba5de505b31bc04f2e501a53806571b52bd4a3715d851ef"
  end

  def install
    bin.install "gobang"
  end

  test do
    system("#{bin}/gobang", "-h")
  end
end
