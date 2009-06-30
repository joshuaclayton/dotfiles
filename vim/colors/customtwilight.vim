" Vim color scheme
" Name:         customtwilight.vim
" Author:       Josh Clayton

" Based on the Twilight theme for TextMate
" Distributable under the same terms as Vim itself (see :help license)

if has("gui_running")
    set background=dark
endif
hi clear
if exists("syntax_on")
"   syntax reset
endif

let colors_name = "customtwilight"

function! s:hifg(group,guifg,...)
    exe "highlight ".a:group." guifg=".a:guifg
endfunction

function! s:hibg(group,guibg,...)
    exe "highlight ".a:group." guibg=".a:guibg
endfunction

call s:hifg("Normal","#EEEEEE","White",87)

if &background == "light" || has("gui_running")
    hi Normal guibg=#141414 ctermbg=Black
else
    hi Normal guibg=Black ctermbg=NONE
endif

highlight StatusLine    guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White  cterm=bold
highlight StatusLineNC  guifg=#444444 guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey   cterm=none
highlight WildMenu      guifg=Black   guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
highlight Cursor        guifg=Black guibg=White ctermfg=Black ctermbg=White
highlight NonText       guifg=#404040 ctermfg=8
highlight Directory     none
high link Directory     Identifier
highlight ErrorMsg      guibg=Red ctermbg=DarkRed guifg=NONE ctermfg=NONE
highlight Search        guifg=NONE ctermfg=NONE gui=none cterm=none
call s:hibg("Search"    ,"#555555","Black",81)
highlight IncSearch     guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight MoreMsg       guifg=#00AA00 ctermfg=Green
highlight Question      none
high link Question      MoreMsg
highlight VisualNOS     gui=none cterm=none
call s:hibg("Visual"    ,"#555577","LightBlue",83)
call s:hibg("VisualNOS" ,"#444444","DarkBlue",81)
highlight WarningMsg    guifg=Red ctermfg=Red
highlight Folded        guibg=#1100aa ctermbg=DarkBlue
call s:hibg("Folded"    ,"#110077")
call s:hifg("Folded"    ,"#aaddee")
highlight FoldColumn    none
high link FoldColumn    Folded
highlight Pmenu         guifg=White ctermfg=White gui=bold cterm=bold
highlight PmenuSel      guifg=White ctermfg=White gui=bold cterm=bold
call s:hibg("Pmenu"     ,"#000099","Blue",18)
call s:hibg("PmenuSel"  ,"#5555ff","DarkCyan",39)
highlight PmenuSbar     guibg=Grey ctermbg=Grey
highlight PmenuThumb    guibg=White ctermbg=White
highlight TabLine       gui=underline cterm=underline
call s:hifg("TabLine"   ,"#bbbbbb")
call s:hibg("TabLine"   ,"#333333")
highlight TabLineSel    guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight TabLineFill   gui=underline cterm=underline
call s:hifg("TabLineFill","#bbbbbb")
call s:hibg("TabLineFill","#808080")

match Error /\%80v.\+/

let tm_comment="#5e5a60"
let tm_constant="#b86f4f"
let tm_entity="#907241"
let tm_keyword="#c3aa6b"
let tm_storage="#f5ef9b"
let tm_string="#929d6b"
let tm_support="#96869d"
let tm_variable="#7b86a5"
let tm_string_regexp="#dec266"
let tm_string_regexp_special="#bb8139"
let tm_support_constant="#b86f4f"
let red="#611506"
let grey="#333333"

call s:hibg("Error",      red)
call s:hibg("SpecialKey", red)
call s:hifg("Folded",     tm_support)
call s:hibg("Folded",     "#222222")
call s:hifg("SpecialKey", "#ffffff")

" FROM TEXTMATE
call s:hifg("Title",      tm_support)
call s:hifg("Comment",    tm_comment)
call s:hifg("String",     tm_string)

call s:hifg("Constant",   tm_support_constant)
call s:hifg("Function",   tm_entity)
call s:hifg("Identifier", tm_variable)

call s:hifg("Statement",  tm_keyword)
call s:hifg("Conditional",tm_keyword)
call s:hifg("Repeat",     tm_keyword)
call s:hifg("Type",       tm_constant)

call s:hifg("Regexp",     tm_string_regexp)
call s:hifg("PreProc",    tm_keyword)
call s:hifg("Special",    tm_string_regexp_special)
call s:hifg("Include",    tm_keyword)

" Ruby-specific
call s:hifg("rubyPredefinedConstant", tm_variable)
call s:hifg("rubyStringDelimiter",    tm_string)
call s:hifg("rubyStringEscape",       tm_keyword)
call s:hifg("rubyInterpolation",      tm_storage)
call s:hifg("rubyInterpolationDelimiter", tm_storage)
call s:hifg("rubyPseudoOperator",     tm_variable)
call s:hifg("rubyInstanceVariable",   tm_variable)
call s:hifg("rubyConstant",           tm_support)
call s:hifg("rubyModule",             tm_keyword)
call s:hifg("rubyModuleDeclaration",  tm_storage)
call s:hifg("rubyPseudoVariable",     tm_variable)
call s:hifg("rubyControl",            tm_keyword)
call s:hifg("rubyFunction",           tm_entity)
call s:hifg("rubyEval",               tm_storage)
call s:hibg("rubyEval",               red)
call s:hifg("railsMethod",            tm_storage)
call s:hifg("rubySymbol",             tm_constant)
call s:hifg("rubyIdentifier",         tm_variable)

call s:hibg("CursorLine",   grey)
call s:hibg("CursorColumn", grey)
call s:hifg("LineNr",       "#dddddd")
call s:hibg("LineNr",       grey)
