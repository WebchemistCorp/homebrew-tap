class Devist < Formula
  desc "Project bootstrap CLI for AI-assisted development"
  homepage "https://github.com/WebchemistCorp/devist"
  version "0.31.1"
  license "MIT"

  depends_on "webchemistcorp/tap/asurada"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/devist/releases/download/v#{version}/devist-aarch64-apple-darwin.tar.gz"
      sha256 "2acfc22cebc5bb905f91d12471a8412f1068e1107381e6248e70145620f99b0b"
    else
      url "https://github.com/WebchemistCorp/devist/releases/download/v#{version}/devist-x86_64-apple-darwin.tar.gz"
      sha256 "635ab50e1123f71ae9871bdd851a5f0cbf7f538f50eda8f449acb9f7b73b5d03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/devist/releases/download/v#{version}/devist-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c358d7b021a47dc3a93b0444088375017de64ad64626ad8162e9f2fdc778ced1"
    else
      url "https://github.com/WebchemistCorp/devist/releases/download/v#{version}/devist-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "659a8cf2fdf7719186f691137a1fdf7713966bd8442c2c0c1afa37c6718458d9"
    end
  end

  def install
    bin.install "devist"
  end

  def caveats
    <<~EOS
      Devist binaries are not yet code-signed with an Apple
      Developer ID. On first launch macOS Gatekeeper may show
      an "unidentified developer" warning. To allow it:

        xattr -d com.apple.quarantine "$(which devist)"

      Or right-click the binary in Finder → Open → Open anyway.
      This warning does NOT appear when installing via
      'cargo install devist' (builds locally).
    EOS
  end

  test do
    assert_match "devist", shell_output("#{bin}/devist --version")
  end
end
