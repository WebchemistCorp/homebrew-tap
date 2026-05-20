class Operatist < Formula
  desc "Business operations CLI for 개인/법인 사업자 — powered by Asurada"
  homepage "https://github.com/WebchemistCorp/operatist"
  version "0.1.0"
  license "MIT"

  depends_on "webchemistcorp/tap/asurada"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-aarch64-apple-darwin.tar.gz"
      sha256 "36f60c57f12279fd5b169f712c3b854bd48ba3c0d5ba4a2379e12e7d1bad8c2d"
    else
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-x86_64-apple-darwin.tar.gz"
      sha256 "dec6372d9f5ad231d4beebc8196a1acba93a2aad2cc6180d8a174c344aec48df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "860e8235bb746ee8dc30ea853b0ccdf7f148656b434170be5f5e4a00a8a4140d"
    else
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e68e0ef888948056eb3412f75cd958aa5dc71c53039edc8b0e0655cd64ee498f"
    end
  end

  def install
    bin.install "operatist"
  end

  def caveats
    <<~EOS
      Operatist binaries are not yet code-signed with an Apple
      Developer ID. On first launch macOS Gatekeeper may show
      an "unidentified developer" warning. To allow it:

        xattr -d com.apple.quarantine ""

      Quick start:
        operatist config set database-url "postgresql://..."
        operatist setup
    EOS
  end

  test do
    assert_match "operatist", shell_output("#{bin}/operatist --version")
  end
end
