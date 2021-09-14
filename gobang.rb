class Gobang < Formula
  desc "Cross-platform TUI database management tool written in Rust"
  homepage "https://github.com/TaKO8Ki/gobang"
  version "0.1.0-alpha.4"
  license "MIT"

  if OS.mac?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "45daf8f56694b5e9da90656fb32cff25c94a7245254c9e4fd8884999dc243bd1"
  elsif OS.linux?
    url "https://github.com/TaKO8Ki/gobang/releases/download/v#{version}/gobang-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3585d909c4f1e972b770456eb03101a11d846c59375a75362f5cb30b720f6d4c"
  end

  def install
    bin.install "gobang"
  end

  test do
    system("#{bin}/gobang", "-h")
  end
end
