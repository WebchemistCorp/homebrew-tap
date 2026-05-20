class Operatist < Formula
  desc "Business operations CLI for 개인/법인 사업자 — powered by Asurada"
  homepage "https://github.com/WebchemistCorp/operatist"
  version "0.1.0"
  license "MIT"

  depends_on "webchemistcorp/tap/asurada"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-aarch64-apple-darwin.tar.gz"
      sha256 "260ea23d260f6004f1a9dd1495162b7900b839f74bb393993ab9e1b183f5aba3"
    else
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-x86_64-apple-darwin.tar.gz"
      sha256 "50e9df26f30906b081951b0ef897032c47328ea3d3bb7e2e4a1a8acdc45f6bd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93a1a77805448f170ddae6c04ac9eeb2fefd63d67356f98957a0fd44080add02"
    else
      url "https://github.com/WebchemistCorp/operatist/releases/download/v0.1.0/operatist-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc64ec7fdea85df69c33f568849a9652603ec83347ce3b365f411d7a14fc7839"
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
