" Webrat steps
Snippet press When I press "<{}>"
Snippet follow When I follow "<{}>"
Snippet fillin When I fill in "<{}>"
Snippet select When I select "<{}>"
Snippet check When I check "<{}>"
Snippet uncheck When I uncheck "<{}>"
Snippet choose When I choose "<{}>"
Snippet see Then I should see "<{}>"
Snippet notsee Then I should not see "<{}>"
Snippet visit When I visit <{}>

" Factory steps
Snippet exist Given a <{factory}> exists with a <{attribute}> of "<{}>"

vmap <buffer> <C-R> !reverse_ascii_table<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
nnoremap <silent> <C-\> :call <SID>align()<CR>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
