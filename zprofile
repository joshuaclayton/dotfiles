path=(/usr/local/sbin /usr/local/bin $path)
path=(/opt/homebrew/sbin /opt/homebrew/bin $path)
path=($HOME/.dotfiles/bin $HOME/.local/bin $HOME/bin /usr/local/share/npm/bin $path)
path=($HOME/.cargo/bin $HOME/.elmenv/bin $path)
. $(brew --prefix asdf)/libexec/asdf.sh
path=($(asdf where python)/bin $path)
path=(.git/safe/../../node_modules/.bin .git/safe/../../bin .git/safe/../../bin/stubs $path)
