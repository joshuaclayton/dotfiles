path=(/usr/local/sbin /usr/local/bin $path)
path=(/opt/homebrew/sbin /opt/homebrew/bin $path)
path=($HOME/.dotfiles/bin $HOME/.local/bin $HOME/bin /usr/local/share/npm/bin $path)
path=($HOME/.cargo/bin $HOME/.elmenv/bin $path)
. $(brew --prefix asdf)/libexec/asdf.sh
if python_path=$(asdf where python 2>/dev/null); then
  if [[ -n "$python_path" ]]; then
    path=("$python_path/bin" $path)
  fi
fi
path=(.git/safe/../../node_modules/.bin .git/safe/../../bin .git/safe/../../bin/stubs $path)

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
