_is_tmux_not_running() {
  [[ -z "$TMUX" ]]
}

_is_tmux_session_list_empty() {
  [[ -z $(tmux ls) ]]
}

_ensure_tmux_is_running() {
  if _is_tmux_session_list_empty; then
    tmux new -d
  fi
}

attach_to_tmux() {
  if _is_tmux_not_running; then
    _ensure_tmux_is_running
    tmux att
  fi
}
