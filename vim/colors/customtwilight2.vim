" Vim color file
"
" Author: Josh Clayton <joshua.clayton@gmail.com>
"
" Notes: Based on the Twilight theme for TextMate

if has("gui_running")
    set background=dark
endif

hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256

let colors_name="customtwilight2"

hi Normal            guifg=#FFFFFF ctermfg=231 guibg=#1A1A1A ctermbg=234 gui=NONE cterm=NONE
hi Cursor            guifg=#000000 ctermfg=16  guibg=#FFFFFF ctermbg=231 gui=NONE cterm=NONE
hi CursorLine                                  guibg=#2E2F30 ctermbg=236 gui=NONE cterm=NONE
hi CursorColumn                                guibg=#2E2F30 ctermbg=236 gui=NONE cterm=NONE
hi StatusLine        guifg=#000000 ctermfg=16  guibg=#AABBEE ctermbg=147 gui=NONE cterm=NONE
hi StatusLineNC      guifg=#444444 ctermfg=238 guibg=#AAAAAA ctermbg=248 gui=NONE cterm=NONE
hi WildMenu          guifg=#000000 ctermfg=16  guibg=#FFFF00 ctermbg=226 gui=NONE cterm=NONE
hi NonText           guifg=#404040 ctermfg=238 gui=NONE cterm=NONE
hi ErrorMsg          guifg=#FFFFFF ctermfg=231 guibg=#FF0000 ctermbg=196 gui=NONE cterm=NONE
hi Search            guifg=#555555 ctermfg=240 gui=NONE cterm=NONE
hi IncSearch         guifg=#FFFFFF ctermfg=231 guibg=#000000 ctermbg=16  gui=NONE cterm=NONE
hi MoreMsg           guifg=#00AA00 ctermfg=34  gui=NONE cterm=NONE
hi Visual            guifg=#555577 ctermfg=60  gui=NONE cterm=NONE
hi VisualNOS         guifg=#444444 ctermfg=238 gui=NONE cterm=NONE
hi Folded            guifg=#AADDEE ctermfg=153 guibg=#110077 ctermbg=18  gui=NONE cterm=NONE
hi Pmenu             guifg=#FFFFFF ctermfg=231 guibg=#000099 ctermbg=18  gui=NONE cterm=NONE
hi PmenuSel          guifg=#FFFFFF ctermfg=231 guibg=#5555FF ctermbg=63  gui=NONE cterm=NONE
hi PmenuSbar                                   guibg=#AAAAAA ctermbg=248 gui=NONE cterm=NONE
hi PmenuThumb                                  guibg=#FFFFFF ctermbg=231 gui=NONE cterm=NONE
hi Tabline           guifg=#BBBBBB ctermfg=250 guibg=#444444 ctermbg=238 gui=underline cterm=underline
hi TabLineSel        guifg=#FFFFFF ctermfg=231 guibg=#000000 ctermbg=16  gui=NONE cterm=NONE
hi TabLineFill       guifg=#BBBBBB ctermfg=250 guibg=#808080 ctermbg=244 gui=underline cterm=underline
hi Title             guifg=#AC8255 ctermfg=137 gui=NONE cterm=NONE
hi Comment           guifg=#726D73 ctermfg=242 gui=NONE cterm=NONE
hi String            guifg=#929D6B ctermfg=107 gui=NONE cterm=NONE
hi Constant          guifg=#B86F4F ctermfg=131 gui=NONE cterm=NONE
hi Function          guifg=#AC8255 ctermfg=137 gui=NONE cterm=NONE
hi Identifier        guifg=#7B86A5 ctermfg=103 gui=NONE cterm=NONE
hi Statement         guifg=#D7B681 ctermfg=180 gui=NONE cterm=NONE
hi Type              guifg=#DA7E62 ctermfg=173 gui=NONE cterm=NONE
hi Regexp            guifg=#DEC266 ctermfg=179 gui=NONE cterm=NONE
hi Special           guifg=#BB8139 ctermfg=137 gui=NONE cterm=NONE
hi LineNr            guifg=#AAAAAA ctermfg=248 guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
hi rubyInterpolation guifg=#F5EF9B ctermfg=228 gui=NONE cterm=NONE
hi rubyEval                                    guibg=#FF0000 ctermbg=196 gui=NONE cterm=NONE
hi rubyConstant      guifg=#AC8255 ctermfg=137 gui=NONE cterm=NONE
hi rubyFunction      guifg=#AC8255 ctermfg=137 gui=NONE cterm=NONE
hi rubySymbol        guifg=#DA7E62 ctermfg=173 gui=NONE cterm=NONE

hi link Directory                  Identifier
hi link Question                   MoreMsg
hi link WarningMsg                 Error
hi link FoldColumn                 Folded
hi link rubyInterpolationDelimiter rubyInterpolation
hi link rubyModuleDeclaration      rubyInterpolation
hi link rubyEval                   rubyInterpolation
hi link Conditional                Statement
hi link Repeat                     Statement
hi link PreProc                    Statement
hi link rubyClass                  Statement
hi link Include                    Statement
hi link xmlTag                     Identifier
hi link xmlTagName                 Identifier
hi link shDeref                    Identifier
hi link pythonFunction             Identifier
hi link rubySharpBang              Special
hi link perlSharpBang              Special
hi link Character                  Number
hi link CursorIm                   Cursor
hi link rubyPredefinedConstant     Identifier
hi link rubyPseudoOperator         Identifier
hi link rubyInstanceVariable       Identifier
hi link rubyPseudoVariable         Identifier
hi link rubyIdentifier             Identifier
hi link rubyStringDelimiter        String
hi link rubyStringEscape           Statement
hi link rubyModule                 Statement
hi link rubyControl                Statement

match Error /\%80v.\+/
