git_prompt_color() {
  if [ -n "$(git_prompt_info)" ]; then
    if [ "changed" = $(git_status) ]; then
      export PS1="${BRIGHT_BLACK}[ ${WHITE}\u ${BRIGHT_WHITE}\w ${BRIGHT_RED}$(git_prompt_info) ${BRIGHT_BLACK}] ${WHITE}\$ ${RESET}"
    elif [ "pending" = $(git_status) ]; then
      export PS1="${BRIGHT_BLACK}[ ${WHITE}\u ${BRIGHT_WHITE}\w ${BRIGHT_YELLOW}$(git_prompt_info) ${BRIGHT_BLACK}] ${WHITE}\$ ${RESET}"
    elif [ "unchanged" = $(git_status) ]; then
      export PS1="${BRIGHT_BLACK}[ ${WHITE}\u ${BRIGHT_WHITE}\w ${BRIGHT_GREEN}$(git_prompt_info) ${BRIGHT_BLACK}] ${WHITE}\$ ${RESET}"
    elif [ "untracked" = $(git_status) ]; then
      export PS1="${BRIGHT_BLACK}[ ${WHITE}\u ${BRIGHT_WHITE}\w ${BRIGHT_CYAN}$(git_prompt_info) ${BRIGHT_BLACK}] ${WHITE}\$ ${RESET}"
    fi
  else
    export PS1="${BRIGHT_BLACK}[ ${WHITE}\u ${BRIGHT_WHITE}\w ${BRIGHT_BLACK}] ${WHITE}\$ ${RESET}"
  fi
}

git_prompt_info() {
  echo $(__git_ps1 "%s")
}

git_status() {
  if [ -n "$(git status | grep 'Changed but not updated' 2> /dev/null)" ]; then
    echo "changed"
  elif [ -n "$(git status | grep 'Changes to be committed' 2> /dev/null)" ]; then
    echo "pending"
  elif [ -n "$(git status | grep 'Untracked files' 2> /dev/null)" ]; then
    echo "untracked"
  else
    echo "unchanged"
  fi
}

PROMPT_COMMAND='git_prompt_color'
