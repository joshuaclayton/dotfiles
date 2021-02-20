source $HOME/.aliasrc

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

if pgrep gpg-agent >/dev/null; then
else
  eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)
fi

cd_to_most_recently_opened_directory
attach_to_tmux

eval "$(starship init zsh)"
