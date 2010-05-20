# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

if [[ -f ~/.current_project ]]; then
  cd $(cat ~/.current_project)
fi
