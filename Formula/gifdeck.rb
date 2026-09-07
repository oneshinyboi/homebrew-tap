class Gifdeck < Formula
  desc "GIF picker for the terminal: search, favorite, clipboard"
  homepage "https://github.com/oneshinyboi/gifdeck"
  version "0.1.0"
  license "GPL-3.0-only"

  # macOS builds are Apple Silicon only; Intel Macs should use
  #  instead (see caveats).
  on_macos do
    url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "8e29226453211f992489d9bb7978dddc13e20321b948c56b8e02237a880c78a5"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd7fbc17c445b3f27e6a038b404b29fce5255d3b35d1060b5da2f493683526fe"
    else
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fde296dd43278a5ffec308d8148749c45946aabdd5dc6439d277e358cdac9743"
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
