class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.3.1/mdmind-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "9699028172888f88857cfce76cf161cc9aa3c8dbd95cfc84f2431e304a44d48c"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.3.1/mdmind-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "008903e11f366674357c10bdd24e3e8e15dd24158676d6fce64818674c2d31be"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.3.1/mdmind-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f8704d9bcc2f22cd7cb21e7123f97951d92ca76064bd76f9fe9fe16d1a62d90"
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
