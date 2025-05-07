if pgrep gpg-agent >/dev/null; then
else
  eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)
fi

