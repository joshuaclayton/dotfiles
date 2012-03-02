export CURRENT_PROJECT_PATH=$HOME/.current-project

setopt auto_cd
cdpath=(. $HOME/dev/personal $HOME/dev/thoughtbot $HOME/dev/gems)

function chpwd {
  echo $(pwd) >! $CURRENT_PROJECT_PATH
  ls
}
