# use vim as an editor
export EDITOR=vim

# vi mode
bindkey -v

source $HOME/.zlogin
source $HOME/.aliases

for a in $HOME/.zsh_profile.d/*; do
  source $a
done
