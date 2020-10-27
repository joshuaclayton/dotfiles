source $HOME/.aliasrc

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --allow-preset-passphrase ~/.gnupg/.gpg-agent-info)
fi

cd_to_most_recently_opened_directory
attach_to_tmux

eval "$(starship init zsh)"
