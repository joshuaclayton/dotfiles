export CURRENT_PROJECT_PATH=$HOME/.current-project

setopt auto_cd
cdpath=($HOME/dev $HOME/dev/thoughtbot $HOME/dev/unused $HOME/dev/gems $HOME/dev/personal)

function chpwd {
  echo "$(pwd)" >! "$CURRENT_PROJECT_PATH"
  local v=$(projections)
  if [[ $? -eq 0 ]]; then
    echo $v > .projections.json
  fi

  ls
}

cd_to_most_recently_opened_directory() {
  if [[ -f $CURRENT_PROJECT_PATH && -d "$(cat "$CURRENT_PROJECT_PATH")" ]]; then
    cd "$(cat "$CURRENT_PROJECT_PATH")"
  fi
}
