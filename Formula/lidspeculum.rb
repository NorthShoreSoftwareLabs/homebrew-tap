class Lidspeculum < Formula
  desc "Keep your computer awake when the lid is closed"
  homepage "https://github.com/NorthShoreSoftwareLabs/lidspeculum"
  url "https://github.com/NorthShoreSoftwareLabs/lidspeculum/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "106024177403676919eb350c147972e8f8ee2faa5b96d2126011e263c3af04f4"
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
