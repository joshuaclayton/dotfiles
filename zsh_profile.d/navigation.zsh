setopt auto_cd
cdpath=(. $HOME/dev/personal $HOME/dev/thoughtbot $HOME/dev/gems)

current() {
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}

current
