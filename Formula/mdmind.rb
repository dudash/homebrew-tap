class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.8.0/mdmind-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "82ed87120ea25abd978c92e2f866cf8773ee3075bf339b01d9a255f7f92136c5"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.8.0/mdmind-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "fe572a8ddcf095b96abd259ff683c0e98d3e37456b5ea4b540b21b8cd73d9b70"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.8.0/mdmind-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "67665c67d532eaccd038af94ef621269b5dc804035e80a7bdd7c3994974f82e7"
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
