class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.4.1/mdmind-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "4e141141188ae7f3854b16be923c0233c54c7695954194bf1e9a277b5b394d84"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.4.1/mdmind-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "aa3e768d44927f02277081376ce0933364aec7a64310aebbfdde65385fb57511"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.4.1/mdmind-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "adac8b7e2e00661dafca4eb66884e97eb4f3f2e0d1c192053c2ded83a0904b07"
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
