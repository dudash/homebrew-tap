class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.5.0/mdmind-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "2c8762f05c758d4a3d775e889aa4e2d4f3f2e7fd57410a4c69c1d4535d70d25b"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.5.0/mdmind-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "a52511a6e7c3e1a3f47201a3e2795bd983c5cad99dfa9563d6aa8bb2ca1abf15"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.5.0/mdmind-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fcd62eabae65c2cbc594ea9e3808602b99ec2b29c59495b6c930872a63bf84c4"
  end

  def install
    root = Dir["mdmind-*"].find { |path| File.directory?(path) } || "."

    bin.install File.join(root, "mdm")
    bin.install File.join(root, "mdmind")

    readme = File.join(root, "README.md")
    doc.install readme if File.exist?(readme)

    examples_dir = File.join(root, "examples")
    pkgshare.install examples_dir if Dir.exist?(examples_dir)
  end

  test do
    assert_match "mdm #{version}", shell_output("#{bin}/mdm version").strip
  end
end
