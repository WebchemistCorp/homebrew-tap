class Curatist < Formula
  desc "Business operations CLI for 개인/법인 사업자 — powered by Asurada"
  homepage "https://github.com/WebchemistCorp/curatist"
  version "0.1.0"
  license "MIT"

  depends_on "webchemistcorp/tap/asurada"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-aarch64-apple-darwin.tar.gz"
      sha256 "9b275f82fc7ac5dbd17e78a912cc3731c5ed6f68a87b381b7f598675297c97cf"
    else
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-x86_64-apple-darwin.tar.gz"
      sha256 "a06c3541c03ef1706c7d0ec27907f43bf9613bfaef17f3c2766645025981af56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33b03fdba038acf015d4c0b854a310b59e39b5669c755814b63f2221460a02b9"
    else
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1e30e0143be93bdcf2cedd94f7096dd0dbb44b9fc3e9626cbf1dc7d07943e57"
    end
  end

  def install
    bin.install "curatist"
  end

  def caveats
    <<~EOS
      Curatist binaries are not yet code-signed with an Apple
      Developer ID. On first launch macOS Gatekeeper may show
      an "unidentified developer" warning. To allow it:

        xattr -d com.apple.quarantine ""

      Quick start:
        curatist config set database-url "postgresql://..."
        curatist setup
    EOS
  end

  test do
    assert_match "curatist", shell_output("#{bin}/curatist --version")
  end
end
