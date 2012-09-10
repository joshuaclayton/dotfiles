export CURRENT_PROJECT_PATH=$HOME/.current-project

setopt auto_cd
cdpath=($HOME/dev/thoughtbot $HOME/dev/gems $HOME/dev/personal)

function chpwd {
  echo $(pwd) >! $CURRENT_PROJECT_PATH
  ls
}

current() {
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}
