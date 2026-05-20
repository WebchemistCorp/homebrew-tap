class Curatist < Formula
  desc "Business operations CLI for 개인/법인 사업자 — powered by Asurada"
  homepage "https://github.com/WebchemistCorp/curatist"
  version "0.1.0"
  license "MIT"

  depends_on "webchemistcorp/tap/asurada"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-aarch64-apple-darwin.tar.gz"
      sha256 "c7de9fa22a56f3848c4c42c588c5d3125769415d33503b10f2bbf9ac849a8e40"
    else
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-x86_64-apple-darwin.tar.gz"
      sha256 "fb0d3ba9381243e85f5482b3e757b2f0ca3c658365311fe45d83e3c4c6833016"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd814525823874d476ab2a8d1bec007d3a855d4a1721402a553b8975a3e8872a"
    else
      url "https://github.com/WebchemistCorp/curatist/releases/download/v0.1.0/curatist-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d22b294d9d3cd32abd760676daf0b93a9cc38866ac1fd2168281bb2c6a6e69ad"
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
