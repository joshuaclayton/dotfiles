source $HOME/.aliasrc

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

cd_to_most_recently_opened_directory
attach_to_tmux
