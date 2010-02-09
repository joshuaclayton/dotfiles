alias ss="script/server"
alias sc='script/console'
alias ga='git add'
alias gp='git pull'
alias gb='git branch'
alias gbr='git branch -r'
alias gci='git commit'
alias oldrake="rake _0.7.3_"
alias bp="cd '/Users/joshuaclayton/Sites/plugins/blueprint-css/lib/'; ruby compress.rb"
alias s="cd ~/Sites"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump && rake db:test:prepare"
alias tf="ruby_test functional"
alias tu="ruby_test unit"
alias stf="TEST=spec ruby_test controllers"
alias stu="TEST=spec ruby_test models"
alias stv="TEST=spec ruby_test views"
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias stop_mysql='sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias start_mysql='sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias current_ruby='which ruby gem irb rake'
alias do_it='rake git:push:staging && cap staging deploy'
alias do_it_live='rake git:push:production && cap production deploy'

reset_profile() {
  source ~/.bash_profile
}
