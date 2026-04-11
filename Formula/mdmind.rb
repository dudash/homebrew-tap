class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.3.0/mdmind-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "b17bc2b8dc208f4e5a18c4d010ecea6c6c3a739996e805026dad1a63c058cc2b"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.3.0/mdmind-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "f291918cbdcc5a03d4e6044e1de19be4912f46909d72d0f7ae05a60d519a2b23"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.3.0/mdmind-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0dce55c327956c7d7b854a0504e1fe43525562acf50a3d729ec169a8f29c83b8"
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
