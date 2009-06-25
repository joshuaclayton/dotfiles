alias ss="script/server"
alias sc='script/console'
alias ga='git add'
alias gp='git pull'
alias gci='git commit'
alias oldrake="rake _0.7.3_"
alias bp="cd '/Users/joshuaclayton/Sites/plugins/blueprint-css/lib/'; ruby compress.rb"
alias s="cd ~/Sites"
alias tu="ruby_test unit"
alias tf="ruby_test functional"
alias ti="ruby_test integration"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump && rake db:test:prepare"

alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias stop_mysql='sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias start_mysql='sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist'

reset_profile() {
  source ~/.bash_profile
}
