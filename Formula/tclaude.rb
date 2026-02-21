class Tclaude < Formula
  desc "Tmux session manager for Claude Code"
  homepage "https://github.com/BoutLabs/tclaude"
  url "https://github.com/BoutLabs/tclaude/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d54a5929d0de54fef1642065ec652311b690be5fa92b72170508da09eb9822fd"
  license "MIT"

  depends_on "tmux"

  def install
    bin.install "bin/tclaude"
    bin.install "bin/tclaude-list"
    bin.install "bin/tclaude-setup"
    bin.install "bin/tclaude-kill"
    bin.install "bin/tclaude-all"
    bin.install "bin/tclaude-log"

    zsh_completion.install "completions/_tclaude"
    zsh_completion.install "completions/_tclaude-kill"
    zsh_completion.install "completions/_tclaude-log"
  end

  def caveats
    <<~EOS
      To set up Telegram notifications, run:
        tclaude-setup

      The notification hook and Claude Code settings must be configured manually:
        cp #{opt_prefix}/hooks/notify-telegram.sh ~/.claude/hooks/
        See: https://github.com/BoutLabs/tclaude#readme
    EOS
  end

  test do
    assert_match "No tmux sessions running", shell_output("#{bin}/tclaude-list 2>&1", 0)
  end
end
