class Curatist < Formula
  desc "Business operations CLI for 개인/법인 사업자 — powered by Asurada"
  homepage "https://github.com/WebchemistCorp/curatist"
  version "0.1.0"
  license "MIT"

  depends_on "webchemistcorp/tap/asurada"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-aarch64-apple-darwin.tar.gz"
      sha256 "9f59af073697c496dec90011385ad908fe37fd01283d97449b63b609ab3cd6dd"
    else
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-x86_64-apple-darwin.tar.gz"
      sha256 "5cb92bc34b22d6288a387a2e021c18bda9a43448158f01781c84736cef2fbcc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1da27b40b79973b777dc21e0c4b954c6483871ebad47c3e6fbbe34858235a585"
    else
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf51f52947ecfebe163569aa3b253dadee21a921c6f8c2d75979902c11c47cf2"
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
