class SureforgeCfr < Formula
  desc "Self-hosted Title 38 CFR index with an MCP server and HTTP API"
  homepage "https://github.com/SureForgeTech/sureforge-cfr"
  url "https://github.com/SureForgeTech/sureforge-cfr/releases/download/v0.2.1/cfr-free-0.2.1.tgz"
  sha256 "ddbdbe46a6d5b56463e5c63afc1f8018f56a3f727b09c73d7a2216676bfb97b2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cfr-free version")
  end
end
