_() {
  test $? -eq 0;
}

cs() {
  if [[ -f script/rails ]]; then
    (script/rails console)
  elif [[ -f script/console ]]; then
    (script/console)
  else;
    print Not a Rails application. Aborting...
    return 1
  fi
}

pwdx() {
  lsof -a -p $1 -d cwd -n | tail -1 | awk '{print $NF}'
}
