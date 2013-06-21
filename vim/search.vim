set incsearch
set ignorecase
set smartcase

set hlsearch
" Toggle search highlighting
map <Leader>h :set invhls <CR>

Bundle 'kien/ctrlp.vim'

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
