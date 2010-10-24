" Vim color file
"
" Author: Josh Clayton <joshua.clayton@gmail.com>
"
" Notes: Based on the Github color theme

if has("gui_running")
    set background=light
endif

hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256

let colors_name="customgithub"

hi Normal       guifg=#000000 ctermfg=16  guibg=#F8F8FF ctermbg=231 gui=NONE cterm=NONE
hi DiffAdd      guifg=#003300 ctermfg=22  guibg=#DDFFDD ctermbg=194 gui=NONE cterm=NONE
hi DiffChange                             guibg=#ECECEC ctermbg=255 gui=NONE cterm=NONE
hi DiffText     guifg=#000033 ctermfg=17  guibg=#DDDDFF ctermbg=189 gui=NONE cterm=NONE
hi DiffDelete   guifg=#DDCCCC ctermfg=252 guibg=#FFDDDD ctermbg=224 gui=NONE cterm=NONE
hi Folded       guifg=#808080 ctermfg=244 guibg=#ECECEC ctermbg=255 gui=bold cterm=bold
hi LineNr       guifg=#BBBBBB ctermfg=250 guibg=#ECECEC ctermbg=255 gui=NONE cterm=NONE
hi NonText      guifg=#808080 ctermfg=244 guibg=#ECECEC ctermbg=255 gui=NONE cterm=NONE
hi VertSplit    guifg=#BBBBBB ctermfg=250 guibg=#BBBBBB ctermbg=250 gui=NONE cterm=NONE
hi StatusLine   guifg=#404040 ctermfg=238 guibg=#BBBBBB ctermbg=250 gui=bold cterm=bold
hi StatusLineNC guifg=#BBBBBB ctermfg=250 guibg=#ECECEC ctermbg=255 gui=italic
hi ModeMsg      guifg=#990000 ctermfg=88  gui=NONE cterm=NONE
hi MoreMsg      guifg=#990000 ctermfg=88  gui=NONE cterm=NONE
hi Title        guifg=#EF5939 ctermfg=203 gui=NONE cterm=NONE
hi WarningMsg   guifg=#EF5939 ctermfg=203 gui=NONE cterm=NONE
hi SpecialKey   guifg=#FFFFFF ctermfg=231 guibg=#FF1100 ctermbg=196 gui=italic
hi MatchParen   guifg=#000000 ctermfg=16  guibg=#CDCDFD ctermbg=189 gui=NONE cterm=NONE
hi Underlined   guifg=#000000 ctermfg=16  gui=underline cterm=underline
hi Directory    guifg=#990000 ctermfg=88  gui=NONE cterm=NONE
hi Visual       guifg=#FFFFFF ctermfg=231 guibg=#3465A4 ctermbg=61  gui=NONE cterm=NONE
hi VisualNOS    guifg=#FFFFFF ctermfg=231 guibg=#204A87 ctermbg=24  gui=NONE cterm=NONE
hi IncSearch    guifg=#000000 ctermfg=16  guibg=#CDCDFD ctermbg=189 gui=italic
hi Search       guifg=#000000 ctermfg=16  guibg=#CDCDFD ctermbg=189 gui=italic
hi Ignore       guifg=#808080 ctermfg=244 gui=NONE cterm=NONE
hi Identifier   guifg=#0086B3 ctermfg=31  gui=NONE cterm=NONE
hi PreProc      guifg=#A0A0A0 ctermfg=247 gui=bold cterm=bold
hi Comment      guifg=#AAAAAA ctermfg=248 gui=italic
hi Constant     guifg=#177F80 ctermfg=30  gui=NONE cterm=NONE
hi String       guifg=#D81745 ctermfg=161 gui=NONE cterm=NONE
hi Function     guifg=#990000 ctermfg=88  gui=bold cterm=bold
hi Statement    guifg=#000000 ctermfg=16  gui=bold cterm=bold
hi Type         guifg=#445588 ctermfg=60  gui=bold cterm=bold
hi Number       guifg=#1C9898 ctermfg=30  gui=NONE cterm=NONE
hi Todo         guifg=#FFFFFF ctermfg=231 guibg=#990000 ctermbg=88  gui=bold cterm=bold
hi Special      guifg=#159828 ctermfg=28  gui=bold cterm=bold
hi rubySymbol   guifg=#960B73 ctermfg=90  gui=NONE cterm=NONE
hi Error        guifg=#F8F8FF ctermfg=231 guibg=#FF1100 ctermbg=196 gui=NONE cterm=NONE
hi Todo         guifg=#F8F8FF ctermfg=231 guibg=#FF1100 ctermbg=196 gui=underline cterm=underline
hi Label        guifg=#000000 ctermfg=16  gui=bold cterm=bold
hi StorageClass guifg=#000000 ctermfg=16  gui=bold cterm=bold
hi Structure    guifg=#000000 ctermfg=16  gui=bold cterm=bold
hi TypeDef      guifg=#000000 ctermfg=16  gui=bold cterm=bold
hi WildMenu     guifg=#7FBDFF ctermfg=111 guibg=#425C78 ctermbg=60  gui=NONE cterm=NONE
hi Pmenu        guifg=#FFFFFF ctermfg=231 guibg=#808080 ctermbg=244 gui=bold cterm=bold
hi PmenuSel     guifg=#000000 ctermfg=16  guibg=#CDCDFD ctermbg=189 gui=italic
hi PmenuSbar    guifg=#444444 ctermfg=238 guibg=#000000 ctermbg=16  gui=NONE cterm=NONE
hi PmenuThumb   guifg=#AAAAAA ctermfg=248 guibg=#AAAAAA ctermbg=248 gui=NONE cterm=NONE
hi TabLine      guifg=#404040 ctermfg=238 guibg=#DDDDDD ctermbg=253 gui=NONE cterm=NONE
hi TabLineFill  guifg=#404040 ctermfg=238 guibg=#DDDDDD ctermbg=253 gui=NONE cterm=NONE
hi TabLineSel   guifg=#404040 ctermfg=238 gui=bold cterm=bold
hi cucumberTags guifg=#333333 ctermfg=236 guibg=#FFFF66 ctermbg=227 gui=bold cterm=bold
hi Cursor       guifg=#F8F8FF ctermfg=231 guibg=#444454 ctermbg=238 gui=NONE cterm=NONE
hi CursorLine                             guibg=#D8D8DD ctermbg=253 gui=NONE cterm=NONE
hi CursorColumn                           guibg=#E8E8EE ctermbg=255 gui=NONE cterm=NONE

hi link vimFold                    Folded
hi link FoldColumn                 Folded
hi link cppSTL                     Function
hi link shVariable                 Function
hi link cppSTLType                 Type
hi link Question                   Type
hi link Character                  Number
hi link htmlTag                    htmlEndTag
hi link htmlLink                   Underlined
hi link CursorIM                   Cursor
hi link VisualNOS                  Visual
hi link xmlTag                     Identifier
hi link shDeref                    Identifier
hi link xmlTagName                 Identifier
hi link pythonFunction             Identifier
hi link rubySharpBang              Special
hi link perlSharpBang              Special
hi link schemeFunc                 Statement
hi link rubyStringDelimiter        String
hi link rubyInterpolationDelimiter String

match Error /\%80v.\+/
