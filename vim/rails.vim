" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

autocmd User Rails Rnavcommand steps features/step_definitions -glob=**/*
autocmd User Rails Rnavcommand routes config -glob=*.* -suffix= -default=routes.rb
autocmd User Rails Rnavcommand initializer config/initializers -glob=**/*
autocmd User Rails Rnavcommand factories spec test -glob=**/* -default=factories
