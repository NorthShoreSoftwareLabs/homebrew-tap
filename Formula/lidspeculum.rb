class Lidspeculum < Formula
  desc "Keep your computer awake when the lid is closed"
  homepage "https://github.com/NorthShoreSoftwareLabs/lidspeculum"
  url "https://github.com/NorthShoreSoftwareLabs/lidspeculum/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "98f5e46f0f1f30679312d96a508bf5a2b249b8eb83cb9fe654d049cb3c915d35"
  license "MIT"
  head "https://github.com/NorthShoreSoftwareLabs/lidspeculum.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "lidspeculum #{version}", shell_output("#{bin}/lidspeculum version")
  end
end
