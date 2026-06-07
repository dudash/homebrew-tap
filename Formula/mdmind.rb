class Mdmind < Formula
  desc "Local-first plain-text mind mapping for structured thinking"
  homepage "https://github.com/dudash/mdmind"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dudash/mdmind/releases/download/v0.9.0/mdmind-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "04ebe643c10349b6ffccb08132b5c879ce04785866ef2137c84137beff3458fb"
    else
      url "https://github.com/dudash/mdmind/releases/download/v0.9.0/mdmind-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "ee56546300d76e9f09f63814a3d4d9cea9edb5e8ebf60cc18c477d00017c2ac0"
    end
  elsif OS.linux?
    url "https://github.com/dudash/mdmind/releases/download/v0.9.0/mdmind-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1232826c3d9867e76dc7e4405871058f6ec1b54018b8b956bd2ad5898fb41169"
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
