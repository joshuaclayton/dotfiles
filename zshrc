source $HOME/.zlogin
source $HOME/.aliases

for a in $HOME/.zsh_profile.d/*; do
  source $a
done
