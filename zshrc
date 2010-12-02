source $HOME/.aliasrc

for a in $HOME/.zsh_profile.d/*; do
  source $a
done
