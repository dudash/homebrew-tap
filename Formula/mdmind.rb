class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.2.0/mdmind-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6977e117296ba1cabe2d6748c6945405972d02606a0a093106587fda431fbd4e"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.2.0/mdmind-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "7d92d748047226b4242be8877d1de1d129323e99e82ff197e14de4ccc539a88c"
    end
  end

  on_linux do
    url "https://github.com/dudash/mdmind/releases/download/v0.2.0/mdmind-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0da93f0cde82a6cc9f7e2bd59a2c7e33214ad3202ebe402c5f56e7d56765a945"
  end
  def install
    bin.install Dir["*/mdm"].first => "mdm"
    bin.install Dir["*/mdmind"].first => "mdmind"
    doc.install Dir["*/README.md"].first
    examples_dir = Dir["*/examples"].first
    pkgshare.install examples_dir if examples_dir
  end

  test do
    assert_match "mdm #{version}", shell_output("#{bin}/mdm version").strip
  end
end
