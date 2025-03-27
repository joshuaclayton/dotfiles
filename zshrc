source $HOME/.aliasrc
export ASDF_DATA_DIR="/Users/joshuaclayton/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

if [ -f $HOME/.aliasrc.local ]; then
  source $HOME/.aliasrc.local
fi

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

if command -v callc &>/dev/null; then
  eval "$(callc completion generate zsh)"
fi

if command -v aws_completer &>/dev/null; then
  complete -C aws_completer aws
fi

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

[ -f "/Users/joshuaclayton/.ghcup/env" ] && source "/Users/joshuaclayton/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

if [ -f $HOME/.zshrc.local ]; then
  source $HOME/.zshrc.local
fi

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
