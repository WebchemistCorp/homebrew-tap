class Workspace < Formula
  desc "Company operations CLI for Webchemist — asset and subscription management"
  homepage "https://github.com/WebchemistCorp/workspace"
  version "0.1.0"
  license "MIT"

  # TODO: 릴리즈 후 URL 및 sha256 추가
  on_macos do
    on_arm do
      url "https://github.com/WebchemistCorp/workspace/releases/download/v#{version}/workspace-aarch64-apple-darwin.tar.gz"
      sha256 ""
    end

    on_intel do
      url "https://github.com/WebchemistCorp/workspace/releases/download/v#{version}/workspace-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "workspace"
  end

  test do
    system "#{bin}/workspace", "--version"
  end
end
