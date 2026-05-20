class Asurada < Formula
  desc "Memory and cognition daemon — local-first AI brain for Webchemist tools"
  homepage "https://github.com/WebchemistCorp/asurada"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/WebchemistCorp/asurada/releases/download/v#{version}/asurada-aarch64-apple-darwin.tar.gz"
      sha256 "e8b59b2583cefaba228c68990fa5f166a59a840faff6e408d7582ef8e7ae8224"
    end

    on_intel do
      url "https://github.com/WebchemistCorp/asurada/releases/download/v#{version}/asurada-x86_64-apple-darwin.tar.gz"
      sha256 "69b3142059ab48a42513ab2179e5b6a1a820f1ddebacb909e3ea3613b3258436"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/WebchemistCorp/asurada/releases/download/v#{version}/asurada-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ec0827c33ce8e5f04360d6acef7c46cd58f68a084ac997a02da8526a8ed7d96"
    end

    on_intel do
      url "https://github.com/WebchemistCorp/asurada/releases/download/v#{version}/asurada-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "005f1ddbb9676111b75e96b94456c485ee3100cac67a5baf5640304036526bb4"
    end
  end

  def install
    bin.install "asurada"
  end

  test do
    system "#{bin}/asurada", "--version"
  end
end
