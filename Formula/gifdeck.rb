class Gifdeck < Formula
  desc "GIF picker for the terminal: search, favorite, clipboard"
  homepage "https://github.com/oneshinyboi/gifdeck"
  version "0.1.1"
  license "GPL-3.0-only"

  # macOS builds are Apple Silicon only; Intel Macs should use
  #  instead (see caveats).
  on_macos do
    url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.1/gifdeck-0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "2cd1c09906a5220db3a347fc4eeac4148495e99c2c1c130f50192b1ed1088019"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.1/gifdeck-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1af6d263904fdc20bacc18422e00a93c35e144a1b411f6cde9f9d7c2b8a7fe2d"
    else
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.1/gifdeck-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2063eeff0ddd8630fc285a1b8d27de66b58cd5b777f25d224afd7e6465ebd1c1"
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
