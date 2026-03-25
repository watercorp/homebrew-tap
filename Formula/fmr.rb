class Fmr < Formula
  desc "Frontmatter Replacment"
  homepage "https://github.com/watercorp/fmr"
  url "https://github.com/watercorp/fmr/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "82e88844a2222e93ed6e3ebb4f468d0d496057b0d39f7642d5746e3ce2a89217"
  license "MIT"

  depends_on "go" => :build

  def install
    zsh_completion.install "_fmr"
    system "go", "build", *std_go_args(ldflags: "-w -s -X main.version=#{version}")
  end

  test do
    system "#{bin}/fmr", "--version"
  end
end
