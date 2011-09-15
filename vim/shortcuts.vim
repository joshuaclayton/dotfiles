" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Disable shift+k
map K <Nop>

" because escape is too far away
imap jj <ESC>

" Custom settings / bindings
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
map <silent> <C-h> ^cw
nnoremap <silent> <F4> :GundoToggle<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

vmap <silent> <C-c> :write! ~/.current-output <CR>
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
