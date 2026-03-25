class Fmr < Formula
  desc "Frontmatter Replacment"
  homepage "https://github.com/watercorp/fmr"
  url "https://github.com/watercorp/fmr/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "353a5625fb1240feb365e578962311317787ce86618b3734301aa0fa7fd94ad3"
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
