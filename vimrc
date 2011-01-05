set nocompatible

let mapleader = "\\"

set nobackup
set nowritebackup
set history=50    " keep 50 lines of command line history
set incsearch     " do incremental searching

set ignorecase
set smartcase

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

source $HOME/.vim/autocmd.vim
source $HOME/.vim/colors.vim
source $HOME/.vim/ctags.vim
source $HOME/.vim/gui.vim
source $HOME/.vim/rails.vim
source $HOME/.vim/sessions.vim
source $HOME/.vim/shortcuts.vim
source $HOME/.vim/syntax_highlighting.vim
source $HOME/.vim/tab_completion.vim
source $HOME/.vim/visual.vim

call pathogen#runtime_append_all_bundles()
