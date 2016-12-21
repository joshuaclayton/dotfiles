# expand functions in the prompt
setopt prompt_subst

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

  if grep -q "Your branch is behind" <<< "$git_status"; then
    difference="-"
  elif grep -q "Your branch is ahead of" <<< "$git_status"; then
    difference="+"
  fi

  if [ -n "$difference" ]; then
    difference+=$(echo $git_status | grep "Your branch is" | sed "s/Your branch is .* by//g;s/[^0-9]//g")
    echo $difference
  fi
}

_git_prompt_color() {
  if [ -n "$1" ]; then
    current_git_status=$(_git_status)
    if [ "changed" = $current_git_status ]; then
      echo "$(_red $1)"
    elif [ "pending" = $current_git_status ]; then
      echo "$(_yellow $1)"
    elif [ "unchanged" = $current_git_status ]; then
      echo "$(_green $1)"
    elif [ "untracked" = $current_git_status ]; then
      echo "$(_cyan $1)"
    else
      echo "$1"
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

_normal_color() {
  if [ -n "$1" ]; then
    echo "%{$fg[$2]%}$1%{$reset_color%}"
  fi
}

_default_color() {
  if [ -n "$1" ]; then
    echo "%{$reset_color%}$1"
  fi
}

_user_name() {
  if [ $USER != "joshuaclayton" ]; then
    echo "$USER "
  fi
}

_separate()               { if [ -n "$1" ]; then echo " $1"; fi }
_grey()                   { echo "$(_default_color "$1")" }
_yellow()                 { echo "$(_normal_color "$1" yellow)" }
_green()                  { echo "$(_normal_color "$1" green)" }
_red()                    { echo "$(_color "$1" red)" }
_cyan()                   { echo "$(_color "$1" cyan)" }

_bracket_wrap()           { echo "$(_grey "[") $1 $(_grey "]") " }
_basic()                  { echo "$(_user_name)$(_colored_path)" }
_colored_path()           { echo "$(_grey "%~")" }
_colored_git_branch()     { echo "$(_git_prompt_color "$(_git_prompt_info)")" }
_colored_git_difference() { echo "$(_yellow "$(_git_difference_from_track)")" }

_display_current_vim_mode() {
  if [[ $VIMODE == 'vicmd' ]]; then
    echo "❌"
  else
    echo "✅"
  fi
}

function zle-line-init zle-keymap-select {
  VIMODE=$KEYMAP
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function precmd {
  $(git status 2> /dev/null >! "/tmp/git-status-$$")
}

_current_ruby() {
  if [[ -n $rvm_path ]]; then
    $rvm_path/bin/rvm-prompt
  fi

  if [[ -n $(rbenv version) ]]; then
    rbenv version-name
  fi
}

_rprompt() {
  if [ $COLUMNS -gt 80 ]; then
    echo "%{$fg[white]%}$(_current_ruby)%{$reset_color%}"
  fi
}

_status_result() {
  echo "%(?,"😊","🙁")"
}

_display_internet_connection_status() {
  result=$(internet-status)

  if [[ (($result -lt 2)) ]]; then
    echo "👎"
  elif [[ (($result == 2)) ]]; then
    echo "👌"
  else
    echo "👍"
  fi
}

PROMPT='$(_display_internet_connection_status) $(_display_current_vim_mode) $(_status_result) $(_bracket_wrap "$(_basic)$(_separate $(_colored_git_branch))$(_separate $(_colored_git_difference))")'
RPROMPT='$(_rprompt)'
