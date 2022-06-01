path=(/opt/homebrew/sbin /opt/homebrew/bin $path)
path=(/usr/local/sbin /usr/local/bin $path)
path=($HOME/.dotfiles/bin $HOME/.local/bin $HOME/bin $GOPATH/bin /usr/local/share/npm/bin $path)
path=($HOME/.elmenv/bin $path)
. $(brew --prefix asdf)/asdf.sh
path=(.git/safe/../../node_modules/.bin .git/safe/../../bin .git/safe/../../bin/stubs $path)
path=($(asdf where python)/bin $path)
