class Fmr < Formula
  desc "Frontmatter Replacment"
  homepage "https://github.com/watercorp/fmr"
  url "https://github.com/watercorp/fmr/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "d2995f8ee438f8ae7f7f035f94ad7fc90fa517cfecbb8fa6cf6ada8a512c5fdb"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-w -s -X main.version=#{version}")
  end

  test do
    system "#{bin}/fmr", "--version"
  end
end
