path=($HOME/.dotfiles/bin $HOME/.local/bin $HOME/bin $GOPATH/bin /usr/local/share/npm/bin /usr/local/sbin /usr/local/bin $path)
path=($HOME/.elmenv/bin $path)
if which elmenv > /dev/null; then eval "$(elmenv init -)"; fi
. $HOME/.asdf/asdf.sh
path=($HOME/.asdf/installs/nodejs/*/.npm/bin $path)
path=(.git/safe/../../node_modules/.bin .git/safe/../../bin .git/safe/../../bin/stubs $path)
source /Users/joshuaclayton/.asdf/installs/rust/1.41.1/env

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$(yarn global bin):$PATH"
