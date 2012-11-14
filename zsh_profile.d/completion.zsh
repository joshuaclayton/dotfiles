# expand functions in the prompt
setopt prompt_subst

autoload -U compinit
compinit

_grb() {
  if [[ -n $(git symbolic-ref HEAD 2> /dev/null) ]]; then
    if (( CURRENT == 2 )); then
      compadd create publish rename delete track
    elif (( CURRENT == 3 )); then
      if [[ $words[2] == "publish" ]]; then
        compadd $(git branch -l | sed "s/[ \*]//g")
      else;
        compadd $(git branch -r | grep -v HEAD | sed "s/.*\///" | sed "s/ //g")
      fi
    elif (( CURRENT == 4 )); then
      compadd $(git remote)
    fi
  else;
    _files
  fi
}
compdef _grb grb

_rake_does_task_list_need_generating() {
  if [[ ! -f .rake_tasks ]]; then return 0;
  else
    accurate=$(stat -f%m .rake_tasks)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake() {
  if [[ -f Rakefile ]]; then
    if _rake_does_task_list_need_generating; then
      rake --silent --tasks | cut -d " " -f 2 | cut -d "[" -f 1 > .rake_tasks
    fi
    compadd $(cat .rake_tasks)
  fi
}
compdef _rake rake

_thor() {
  compadd $(thor list | grep "thor " | cut -d " " -f 2)
}
compdef _thor thor

# if using rvm, add rvm_leave_gem_alone=1 to ~/.rvmrc
_gem() {
  if (( CURRENT == 2 )); then
    compadd $(gem help commands | grep '^    ' | awk '{print $1}')
  elif (( CURRENT == 3 )); then
    if [[ $words[2] == "install" ]]; then
      if [[ ! -f $REMOTE_GEM_CACHE_PATH ]]; then
        $(gem list -r > $REMOTE_GEM_CACHE_PATH)
      fi
      compadd $(cat $REMOTE_GEM_CACHE_PATH | grep "(" | awk '{print $1}')
    elif [[ $words[2] == "uninstall" || $words[2] == "which" || $words[2] == "update" || $words[2] == "dependency" ]]; then
      compadd $(gem list | grep "(" | awk '{print $1}')
    else;
    fi
  fi
}
compdef _gem gem

function __filter_homebrew {
  if [[ $1 == "" ]]; then
    cat $HOMEBREW_SEARCH_CACHE_PATH
  else;
    cat $HOMEBREW_SEARCH_CACHE_PATH | grep $1
  fi
}

_brew() {
  if (( CURRENT == 2 )); then
    compadd list
    compadd install uninstall
    compadd link unlink
    compadd missing prune cleanup
    compadd upgrade update outdated
    compadd info edit options deps uses
    compadd home doctor update search
  elif (( CURRENT >= 3 )); then
    if (( CURRENT == 3 )); then
      if [[ $words[2] == "options" || $words[2] == "info" || $words[2] == "edit" || $words[2] == "options" || $words[2] == "deps" || $words[2] == "uses" || $words[2] == "home" ]]; then
        compadd $(__filter_homebrew ${words[3]})
      fi
    fi

    if [[ $words[2] == "install" ]]; then
      compadd $(__filter_homebrew ${words[-1]})
    elif [[ $words[2] == "uninstall" ]]; then
      compadd $(brew list)
    elif [[ $words[2] == "unlink" ]]; then
      compadd $(brew list)
    elif [[ $words[2] == "cleanup" ]]; then
      compadd $(brew list --versions | grep ' .* ' | awk '{print $1}')
    elif [[ $words[2] == "upgrade" ]]; then
      compadd $(brew outdated | awk '{print $1}')
    fi
  fi
}
compdef _brew brew

_cheat() {
  compadd $(cheat sheets)
}
compdef _cheat cheat

_ack() {
  if (( CURRENT == 2 )); then
    if [[ -a tmp/tags ]]; then
      compadd $(cut -f 1 tmp/tags | uniq)
    fi
  else;
    _files
  fi
}

compdef _ack ack
