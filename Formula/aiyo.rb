# Homebrew formula for the Aiyo CLI verifier.
#
# Installs `aiyo-verify` (from the @aiyoplane/verify npm package) as a native
# macOS command. Wraps the npm-published binary so users don't need to have
# Node installed themselves — Homebrew pulls Node as a dependency.
#
# Publish workflow:
#   1. Bump `version` and update `url` + `sha256` to match the new npm tarball.
#   2. `brew audit --new --strict aiyo` (locally, from the tap root)
#   3. Commit + push to github.com/aiyoplane/homebrew-tap
#
# Users install with:
#   brew tap aiyoplane/tap
#   brew install aiyo
#
# Or in one line:
#   brew install aiyoplane/tap/aiyo

class Aiyo < Formula
  desc "Offline Ed25519 verifier for Aiyo execution receipts (Aiyoplane, Inc.)"
  homepage "https://aiyoplane.com"
  # The URL points at the npm-published tarball for the corresponding version.
  # Homebrew unpacks the tarball, installs its Node deps into a private prefix,
  # and symlinks the CLI entry into the Homebrew bin.
  url "https://registry.npmjs.org/@aiyoplane/verify/-/verify-1.0.1.tgz"
  sha256 "5c9faff259b76a7bfc7eed00377e646f9b689cda20999d3f60cfe6acfccb4410"
  license "Apache-2.0"
  version "1.0.1"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Sanity check — the CLI should print its version.
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/aiyo-verify --version"))

    # Sanity check — help output should mention Aiyo.
    help_output = shell_output("#{bin}/aiyo-verify --help")
    assert_match "Aiyo", help_output
    assert_match "receipt", help_output
  end
end
