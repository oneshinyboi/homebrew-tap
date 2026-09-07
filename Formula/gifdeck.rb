class Gifdeck < Formula
  desc "GIF picker for the terminal: search, favorite, clipboard"
  homepage "https://github.com/oneshinyboi/gifdeck"
  version "0.1.0"
  license "GPL-3.0-only"

  # macOS builds are Apple Silicon only; Intel Macs should use
  #  instead (see caveats).
  on_macos do
    url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "a9eb88d3790cec447e3720ba0097cecae97b3bad181582d1fa159cc4cafb5ca0"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c84c6740ee794854f1eb6ed6652bf469b3063722c03a587ecff762b5f8c97e45"
    else
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56ac4fe0edf05adc3bea1c4c8100dc9d043864555e9f053645b8a4f2e30bdc50"
    end
  end

  def install
    bin.install "gifdeck"
  end

  def caveats
    <<~EOS
      Searching needs a GIPHY_API_KEY or KLIPY_API_KEY in
      ~/.config/gifdeck/config.json (see the gifdeck README).

      Prebuilt bottles are Apple Silicon only; on an Intel Mac,
      install with  instead.
    EOS
  end
end
