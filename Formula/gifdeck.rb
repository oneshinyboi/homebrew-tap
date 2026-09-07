class Gifdeck < Formula
  desc "GIF picker for the terminal: search, favorite, clipboard"
  homepage "https://github.com/oneshinyboi/gifdeck"
  version "0.1.0"
  license "GPL-3.0-only"

  # macOS builds are Apple Silicon only; Intel Macs should use
  #  instead (see caveats).
  on_macos do
    url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "652986e76e533eecf5870c6f268339cd3f8cf78afc794d05d27eb576d1568fcd"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a5eecf460c2ceaffe3d31dfe47616f2d2b17017b23f390f5c83965e02f27aa7"
    else
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c3ea4f8d5672a4b854ddf3379cbc8d27928aceaf389aec8fabc2c2b7a828b00"
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
