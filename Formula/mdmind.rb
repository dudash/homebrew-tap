class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.4.0/mdmind-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "7354168ff4ac1deced5f91be6ea993ce6800e6c9e0615205b51341446d13835d"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.4.0/mdmind-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "56c1c3d92de1ae86dbcedf90095c3825d26448b883ca5f9a50a84ba7a46ba246"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.4.0/mdmind-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ffdad031f847abfac32dad9c280fded0952748d7a6b313d0697faa05c39b9ed6"
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
