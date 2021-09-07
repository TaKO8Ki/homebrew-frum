class Gobang < Formula
  desc "Cross-platform TUI database management tool written in Rust"
  homepage "https://github.com/TaKO8Ki/gobang"
  version "0.1.0-alpha.2"
  license "MIT"

  if OS.mac?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "4f5ae5223e910cc2e74513706af36f97043d99fdb7f22979383e19c99bc5cdbd"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-v#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ae8a1f2cce8458530f7dead6a30a899f1e0e8e0e793cdbceb45bf002b620af7f"
  end

  def install
    bin.install "gobang"
  end

  test do
    system("#{bin}/gobang", "-h")
  end
end
