source $HOME/.aliasrc
export ASDF_DATA_DIR="/Users/joshuaclayton/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

if [ -f $HOME/.aliasrc.local ]; then
  source $HOME/.aliasrc.local
fi

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

cd_to_most_recently_opened_directory
attach_to_tmux

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

if [ -f $HOME/.zshrc.local ]; then
  source $HOME/.zshrc.local
fi

# Adding NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Adding pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
