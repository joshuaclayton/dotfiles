" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

set cursorline
set list listchars=tab:»·,trail:·
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set scrolloff=3

" Numbers
set number
set numberwidth=5

" Words
set gdefault
set shiftround
set nowrap

" Hide search highlighting
map <Leader>h :set invhls <CR>

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
