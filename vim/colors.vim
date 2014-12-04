Plugin 'altercation/vim-colors-solarized'

set t_Co=256
colorscheme solarized
set background=light
call togglebg#map("<F6>")
match Error /\%80v.\+/

syntax on
