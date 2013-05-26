set nocompatible

let mapleader = "\\"

source $HOME/.vim/vundle.vim

Bundle 'othree/html5.vim'
Bundle 'matchit.zip'
Bundle 'tComment'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'vim-coffee-script'

source $HOME/.vim/backup_files.vim
source $HOME/.vim/clipboard.vim
source $HOME/.vim/colors.vim
source $HOME/.vim/ctags.vim
source $HOME/.vim/git.vim
source $HOME/.vim/gui.vim
source $HOME/.vim/history.vim
source $HOME/.vim/rails.vim
source $HOME/.vim/ruby.vim
source $HOME/.vim/search.vim
source $HOME/.vim/sessions.vim
source $HOME/.vim/shortcuts.vim
source $HOME/.vim/syntax_highlighting.vim
source $HOME/.vim/tab_completion.vim
source $HOME/.vim/tmux.vim
source $HOME/.vim/visual.vim

filetype plugin indent on

source $HOME/.vim/autocmd.vim
