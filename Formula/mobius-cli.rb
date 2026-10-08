class MobiusCli < Formula
  desc "Terminal client for möbius"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  depends_on "citizenhicks/mobius/mobius-gateway"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.16.30/mobius-0.16.30-aarch64-apple-darwin.tar.gz"
      sha256 "80bcf9655588a69112a340adcfbcfbadec9d15daee36d49723c164c29f7f953c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.16.30/mobius-0.16.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ad8738de7607914df0b7faa5df37e24fc0e49ac2a4a51ca0186d66e037a881f"
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
