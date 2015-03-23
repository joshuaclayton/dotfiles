export ENV_AUTHORIZATION_FILE=$HOME/.env_auth
export LAST_AUTHORIZED_ENV

_dotenv_hash_pair() {
  env_file=$1
  env_shasum=$(shasum "$env_file" | cut -d" " -f1)
  echo "$env_file:$env_shasum"
}

_dotenv_authorized_env_file() {
  env_file=$1
  pair=$(_dotenv_hash_pair "$env_file")
  touch "$ENV_AUTHORIZATION_FILE"
  grep -Gq "$pair" "$ENV_AUTHORIZATION_FILE"
}

_dotenv_authorize() {
  env_file=$1
  _dotenv_deauthorize $env_file
  _dotenv_hash_pair "$env_file" >> "$ENV_AUTHORIZATION_FILE"
}

_dotenv_deauthorize() {
  env_file=$1
  scrubbed_auth=$(grep -Gv "$env_file" "$ENV_AUTHORIZATION_FILE")
  echo "$scrubbed_auth" > "$ENV_AUTHORIZATION_FILE"
}

_dotenv_print_unauthorized_message() {
  echo "Attempting to load unauthorized env: $1"
  echo ""
  echo "**********************************************"
  echo ""
  cat "$1"
  echo ""
  echo "**********************************************"
  echo ""
  echo "Would you like to authorize it? (y/n)"
}

_export_environment_variables() {
  LAST_AUTHORIZED_ENV="$1"
  export $(cat "$1" | grep -v '^#')
}

_dotenv_source_env() {
  local env_file="$PWD/.env"

  if [[ -f $env_file ]]; then
    if _dotenv_authorized_env_file "$env_file"; then
      _export_environment_variables "$env_file"
      return 0
    fi

    _dotenv_print_unauthorized_message "$env_file"

    read answer

    if [[ $answer == "y" ]]; then
      _dotenv_authorize "$env_file"
      _export_environment_variables "$env_file"
    fi
  fi
}

_unset_last_authorized_env() {
  if [[ -f "$LAST_AUTHORIZED_ENV" ]]; then
    unset $(cat "$LAST_AUTHORIZED_ENV" | grep -v '^#' | cut -d"=" -f1)
    LAST_AUTHORIZED_ENV=
  fi
}

chpwd_functions=(_unset_last_authorized_env $chpwd_functions _dotenv_source_env)
