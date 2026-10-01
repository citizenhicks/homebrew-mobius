class MobiusCli < Formula
  desc "Terminal client for möbius"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  depends_on "citizenhicks/mobius/mobius-gateway"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.16.6/mobius-0.16.6-aarch64-apple-darwin.tar.gz"
      sha256 "5c84f359dad476ce43f027980e789b5586e4f51cfd13535ab069dc8bf5d74484"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.16.6/mobius-0.16.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac0898cb3715d4a586a877b6668bd186a986bb9dba9e7e682ec7fffab24b4811"
    end
  end

  def install
    libexec.install "mobius"
    libexec.install_symlink formula_opt_libexec("mobius-gateway")/"mobius-gateway"
    bin.install_symlink libexec/"mobius"
    man1.install Dir["share/man/man1/mobius*.1"].reject { |path| path.include?("mobius-gateway") }
    pkgshare.install "LICENSE", "NOTICE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius --version")
    assert_predicate libexec/"mobius-gateway", :executable?
  end
end
