# expand functions in the prompt
setopt prompt_subst

autoload -U compinit
compinit

# autocompletion for ruby_test
# works with tu/tf aliases
_ruby_tests() {
  if [[ -n $words[2] ]]; then
    compadd $(ruby_test -l ${words[2]})
  fi
}
compdef _ruby_tests ruby_test

# autocompletion for ruby_spec
# works with sm/sc aliases
_ruby_specs() {
  if [[ -n $words[2] ]]; then
    compadd $(ruby_spec -l ${words[2]})
  fi
}
compdef _ruby_specs ruby_spec

_git_remote_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    if (( CURRENT == 2 )); then
      # first arg: operation
      compadd create publish rename delete track
    elif (( CURRENT == 3 )); then
      if [[ $words[2] == "publish" ]]; then
        # second arg: local branch name
        compadd $(git branch -l | sed "s/[ \*]//g")
      else;
        # second arg: remote branch name
        compadd $(git branch -r | grep -v HEAD | sed "s/.*\///" | sed "s/ //g")
      fi
    elif (( CURRENT == 4 )); then
      # third arg: remote name
      compadd $(git remote)
    fi
  else;
    _files
  fi
}
compdef _git_remote_branch grb

# autocompletion for cuc
_cucumber_features() {
  compadd $(ls features/**/*.feature | sed "s/features\/\(.*\).feature/\1/")
}
compdef _cucumber_features cuc

_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    accurate=$(stat -f%m .rake_tasks)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd $(cat .rake_tasks)
  fi
}

compdef _rake rake

_thor () {
  compadd $(thor list | grep "thor " | cut -d " " -f 2)
}

compdef _thor thor

# if using rvm, add rvm_leave_gem_alone=1 to ~/.rvmrc
_gem () {
  if ((CURRENT == 2)); then
    compadd $(gem help commands | grep '^    ' | awk '{print $1}')
  elif ((CURRENT == 3)); then
    if [[ $words[2] == "install" ]]; then
      if [ ! -f ~/.remote-gem-cache ]; then
        $(gem list -r > ~/.remote-gem-cache)
      fi
      compadd $(cat ~/.remote-gem-cache | grep "(" | awk '{print $1}')
    elif [[ $words[2] == "uninstall" || $words[2] == "which" || $words[2] == "update" || $words[2] == "dependency" ]]; then
      compadd $(gem list | grep "(" | awk '{print $1}')
    else;
    fi
  fi
}

compdef _gem gem

_brew () {
  if ((CURRENT == 2)); then
    compadd install uninstall
    compadd link unlink
    compadd missing outdated prune cleanup
    compadd info edit options deps uses
    compadd home doctor update search
  elif ((CURRENT == 3)); then
    if [[ $words[2] == "install" || $words[2] == "options" || $words[2] == "info" || $words[2] == "edit" || $words[2] == "options" || $words[2] == "deps" || $words[2] == "uses" || $words[2] == "home" ]]; then
      compadd $(brew search ${words[3]})
    elif [[ $words[2] == "uninstall" ]]; then
      compadd $(brew list)
    else;
    fi
  fi
}

compdef _brew brew

_cheat () {
  compadd $(cheat sheets)
}

compdef _cheat cheat
