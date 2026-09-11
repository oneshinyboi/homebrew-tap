class Gifdeck < Formula
  desc "GIF picker for the terminal: search, favorite, clipboard"
  homepage "https://github.com/oneshinyboi/gifdeck"
  version "0.2.0"
  license "GPL-3.0-only"

  # macOS builds are Apple Silicon only; Intel Macs should use
  #  instead (see caveats).
  on_macos do
    url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.2.0/gifdeck-0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "95e59ee5a45fb194eb8c57ab2f2eab5e71492e7934ee26ced725bbb27e054cca"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.2.0/gifdeck-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf5fed6a8ef172de12483922ca8e66a3acb24212984db7b32deaba18a2326430"
    else
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.2.0/gifdeck-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "675bb620ab622bb41ef4cdccb85a012219f30484b52dbf9a2d41e58bc9bee5e7"
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
