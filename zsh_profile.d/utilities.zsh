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
