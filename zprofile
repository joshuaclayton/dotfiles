path=($HOME/.dotfiles/bin $HOME/.local/bin $HOME/bin $GOPATH/bin /usr/local/share/npm/bin /usr/local/sbin /usr/local/bin $path)
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
path=($HOME/.elmenv/bin $path)
if which elmenv > /dev/null; then eval "$(elmenv init -)"; fi
. $HOME/.asdf/asdf.sh
. "/usr/local/opt/nvm/nvm.sh"
path=(.git/safe/../../node_modules/.bin .git/safe/../../bin .git/safe/../../bin/stubs $path)
