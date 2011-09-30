_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [ -n $ref ]; then
    branch_name="${ref#refs/heads/}"
    branch_name_max_length=$(($COLUMNS/5))
    if [ ${#branch_name} -gt $branch_name_max_length ]; then
      echo "$branch_name[0,$(($branch_name_max_length-3))]..."
    else
      echo $branch_name
    fi
  fi
}

_git_status() {
  git_status=$(cat "/tmp/git-status-$$")
  if [ -n "$(echo $git_status | grep "Changes not staged")" ]; then
    echo "changed"
  elif [ -n "$(echo $git_status | grep "Changes to be committed")" ]; then
    echo "pending"
  elif [ -n "$(echo $git_status | grep "Untracked files")" ]; then
    echo "untracked"
  else
    echo "unchanged"
  fi
}

_git_difference_from_track() {
  git_status=$(cat "/tmp/git-status-$$")

  if [ -n "$(echo $git_status | grep "Your branch is behind")" ]; then
    difference="-"
  elif [ -n "$(echo $git_status | grep "Your branch is ahead of")" ]; then
    difference="+"
  fi

  if [ -n $difference ]; then
    difference+=$(echo $git_status | grep "Your branch is" | sed "s/Your branch is .* by//g" | sed "s/[^0-9]//g")
    echo $difference
  fi
}

_git_prompt_color() {
  if [ -n "$1" ]; then
    current_git_status=$(_git_status)
    if [ "changed" = $current_git_status ]; then
      echo "%{$fg_bold[red]%}$1%{$reset_color%}"
    elif [ "pending" = $current_git_status ]; then
      echo "%{$fg_bold[yellow]%}$1%{$reset_color%}"
    elif [ "unchanged" = $current_git_status ]; then
      echo "%{$fg_bold[green]%}$1%{$reset_color%}"
    elif [ "untracked" = $current_git_status ]; then
      echo "%{$fg_bold[cyan]%}$1%{$reset_color%}"
    fi
  else
    echo "$1"
  fi
}

_color() {
  if [ -n "$1" ]; then
    echo "%{$fg_bold[$2]%}$1%{$reset_color%}"
  fi
}

_user_name() {
  if [ $USER != "joshuaclayton" ]; then
    echo "$USER "
  fi
}

_separate()               { if [ -n "$1" ]; then echo " $1"; fi }
_white()                  { echo "$(_color "$1" white)" }
_grey()                   { echo "$(_color "$1" grey)" }
_yellow()                 { echo "$(_color "$1" yellow)" }

_bracket_wrap()           { echo "$(_grey "[") $1 $(_grey "]") " }
_basic()                  { echo "$(_user_name)$(_colored_path)" }
_colored_path()           { echo "$(_grey "%~")" }
_colored_git_branch()     { echo "$(_git_prompt_color "$(_git_prompt_info)")" }
_colored_git_difference() { echo "$(_yellow "$(_git_difference_from_track)")" }

_display_current_vim_mode() {
  if [[ $VIMODE == 'vicmd' ]]; then
    echo "$(_color "✘" red)"
  else
    echo "$(_color "✔" green)"
  fi
}

function zle-line-init zle-keymap-select {
  VIMODE=$KEYMAP
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function precmd {
  $(git status 2> /dev/null > "/tmp/git-status-$$")
  echo $(pwd) > $CURRENT_PROJECT_PATH
}

export PS1='$(_bracket_wrap "$(_basic)$(_separate $(_colored_git_branch))$(_separate $(_colored_git_difference)) $(_display_current_vim_mode)")'
