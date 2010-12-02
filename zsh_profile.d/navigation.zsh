setopt auto_cd
cdpath=(. ~/dev/personal ~/dev/thoughtbot ~/dev/gems)

current () {
  if [[ -f ~/.current_project ]]; then
    cd $(cat ~/.current_project)
  fi
}

current
