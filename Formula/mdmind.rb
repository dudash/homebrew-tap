class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.6.0/mdmind-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "8f473dd4231e065e93a830ec3582f542f55412110159de8239a770482c8ce9a6"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.6.0/mdmind-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "b379789b03519ae4a6ebcc0f22aff3681995496c1317c3ca476af3b143dc7f92"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.6.0/mdmind-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "348b71c9a3f183e9218e113b828809cb7d7f8a65b5ab4f227f6eaf074cf9aaee"
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
