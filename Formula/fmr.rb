class Fmr < Formula
  desc "Frontmatter Replacment"
  homepage "https://github.com/watercorp/fmr"
  url "https://github.com/watercorp/fmr/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "34bca602da87b06c5bf4430c5131feb5425dfeaa200204e4f9d3d6beb0e53453"
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
