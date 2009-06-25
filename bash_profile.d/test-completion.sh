function make-completion-wrapper () {
  local function_name="$2"
  local arg_count=$(($#-3))
  local comp_function_name="$1"
  shift 2
  local function="
function $function_name {
  ((COMP_CWORD+=$arg_count))
  COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
  "$comp_function_name"
  return 0
}"
  eval "$function"
}

_ruby_tests() {
  typ="${COMP_WORDS[1]}"
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=()
  if [[ -n $cur ]]; then
    tests=`ruby_test -l "${typ}"`
    COMPREPLY=( $(compgen -W "${tests}" ${cur}) )
  fi
}

make-completion-wrapper _ruby_tests _tf ruby_test functional
make-completion-wrapper _ruby_tests _tu ruby_test unit
complete -F _ruby_tests ruby_test
complete -F _tf tf
complete -F _tu tu
