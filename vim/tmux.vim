Plugin 'jgdavey/tslime.vim'

Plugin 'thoughtbot/vim-rspec'
"
" use zsh to rerun last command
nmap <Leader>rr :call Send_to_Tmux("r\n")<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
