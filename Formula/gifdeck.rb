class Gifdeck < Formula
  desc "GIF picker for the terminal: search, favorite, clipboard"
  homepage "https://github.com/oneshinyboi/gifdeck"
  version "0.1.0"
  license "GPL-3.0-only"

  # macOS builds are Apple Silicon only; Intel Macs should use
  #  instead (see caveats).
  on_macos do
    url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "46830f282397dcf112de9064f6a2bd811eed0ef0ae3074663fb493bf961d30bf"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17a002dcc3905c1c2acba7d11facb0ed6f5765bab72a7f7897df0665cdc226e0"
    else
      url "https://github.com/oneshinyboi/gifdeck/releases/download/v0.1.0/gifdeck-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64e8f41f5cad369a3d98b63afe65d565b632ec6393e2c792d1dc815dd5c1c181"
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
