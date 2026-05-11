class SlateCli < Formula
  desc "Command-line client for Slate (slatetodo.com)"
  homepage "https://github.com/wprodev/slate-todo-cli"
  url "https://cli.slatetodo.com/download/releases/0.2.0/slate-cli-0.2.0.tar.gz"
  sha256 "6421bf6c49bb8b2e557cb5a5a91f8fd0f9e9f70d5a403663c3f920ca0145819a"
  license "MIT"
  version "0.2.0"

  depends_on "node"

  def install
    libexec.install "slate.mjs", "package.json"
    (bin/"slate").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/slate.mjs" "$@"
    EOS
    chmod 0755, bin/"slate"
  end

  test do
    assert_match(/slate \d+\.\d+\.\d+/, shell_output("#{bin}/slate --version"))
  end
end
