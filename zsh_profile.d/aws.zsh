export JAVA_HOME="$(/usr/libexec/java_home)"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.10.003/libexec"

function set_ec2_credentials {
  if [[ -n $AWS_APP ]]; then
    export EC2_PRIVATE_KEY="$HOME/.ssh/$AWS_APP-pkcs8.pem"
    export EC2_CERT="$HOME/.ssh/$AWS_APP-cert.pem"
  fi
}

chpwd_functions=($chpwd_functions set_ec2_credentials)
