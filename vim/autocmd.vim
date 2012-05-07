if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  autocmd BufWinEnter,WinEnter * setlocal cursorline
  autocmd BufWinLeave,WinLeave * setlocal nocursorline

  autocmd BufWinEnter,WinEnter * setlocal colorcolumn=80
  autocmd BufWinLeave,WinLeave * setlocal colorcolumn=0

  autocmd BufWinEnter,WinEnter * setlocal cursorcolumn
  autocmd BufWinLeave,WinLeave * setlocal nocursorcolumn

  autocmd BufWinLeave * call clearmatches()

  autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead Guardfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead Appraisals setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.mustache set filetype=mustache
  autocmd BufNewFile,BufRead *.gemfile set filetype=ruby
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead *.md set filetype=markdown

  autocmd FileType text,markdown setlocal textwidth=78

  " turn syntax highlighting on all the friggin' time;
  " that way, chars > 80 get highlighted always
  autocmd BufRead,BufNewFile * :syntax on
else
  set autoindent
endif
