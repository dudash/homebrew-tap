class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.7.0/mdmind-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf027535f4dde5191989cce94d4d72a8fccc5986b056ce0998a842765412e343"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.7.0/mdmind-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "228f4c9d0c741d9aeb4f527fcf6f5660263866ce6fa294b2abbcb7602db74be8"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.7.0/mdmind-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e7b7142b6c36554f3b9e0723d8cdc614715f7023b6a07e0b314dcbaa95da78f9"
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
