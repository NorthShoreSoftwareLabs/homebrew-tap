class Lidspeculum < Formula
  desc "Keep your computer awake when the lid is closed"
  homepage "https://github.com/NorthShoreSoftwareLabs/lidspeculum"
  url "https://github.com/NorthShoreSoftwareLabs/lidspeculum/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "808acd9565a6e09dd91118cf81301403e0495f2e498f7d881fe9e23fd22a34c7"
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
