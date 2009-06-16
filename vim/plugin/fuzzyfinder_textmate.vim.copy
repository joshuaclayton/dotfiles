if has("ruby")

" ====================================================================================
" COPIED FROM FUZZYFINDER.VIM {{{
" since they can't be called from outside fuzzyfinder.vim
" ====================================================================================
function! s:GetCurrentTagFiles()
  return sort(filter(map(tagfiles(), 'fnamemodify(v:val, '':p'')'), 'filereadable(v:val)'))
endfunction

function! s:HighlightPrompt(prompt, highlight)
  syntax clear
  execute printf('syntax match %s /^\V%s/', a:highlight, escape(a:prompt, '\'))
endfunction

function! s:HighlightError()
  syntax clear
  syntax match Error  /^.*$/
endfunction

function! s:OpenBuffer(nr, mode)
  execute printf([
        \   ':%sbuffer',
        \   ':%ssbuffer',
        \   ':vertical :%ssbuffer',
        \   ':tab :%ssbuffer',
        \ ][a:mode], a:nr)
endfunction

function! s:OpenFile(path, mode)
  let nr = bufnr('^' . a:path . '$')
  if nr > -1
    call s:OpenBuffer(nr, a:mode)
  else
    execute [
          \   ':edit ',
          \   ':split ',
          \   ':vsplit ',
          \   ':tabedit ',
          \ ][a:mode] . s:EscapeFilename(a:path)
  endif
endfunction

function! s:EscapeFilename(fn)
  return escape(a:fn, " \t\n*?[{`$%#'\"|!<")
endfunction
" ------------------------------------------------------------------------------------
" }}}
" ====================================================================================

command! -bang -narg=? -complete=file   FuzzyFinderTextMate   call FuzzyFinderTextMateLauncher(<q-args>, len(<q-bang>))

function! InstantiateTextMateMode() "{{{
ruby << RUBY
  begin
    require "#{ENV['HOME']}/.vim/ruby/fuzzy_file_finder"
  rescue LoadError
    begin
      require 'rubygems'
      begin
        gem 'fuzzy_file_finder'
      rescue Gem::LoadError
        gem 'jamis-fuzzy_file_finder'
      end
    rescue LoadError
    end

    require 'fuzzy_file_finder'
  end
RUBY

  " Configuration option: g:fuzzy_roots
  " Specifies roots in which the FuzzyFinder will search.
  if !exists('g:fuzzy_roots')
    let g:fuzzy_roots = ['.']
  endif

  " Configuration option: g:fuzzy_ceiling
  " Specifies the maximum number of files that FuzzyFinder allows to be searched
  if !exists('g:fuzzy_ceiling')
    let g:fuzzy_ceiling = 10000
  endif

  " Configuration option: g:fuzzy_ignore
  " A delimited list of file glob patterns to ignore. Entries may be delimited
  " with either commas or semi-colons.
  if !exists('g:fuzzy_ignore')
    let g:fuzzy_ignore = ""
  endif

  " Configuration option: g:fuzzy_enumerating_limit
  " The maximum number of matches to return at a time. Defaults to 200, via the
  " g:FuzzyFinderMode.TextMate.enumerating_limit variable, but using a global variable
  " makes it easier to set this value.

ruby << RUBY
  def finder
    @finder ||= begin
      roots = VIM.evaluate("g:fuzzy_roots").split("\n")
      ceiling = VIM.evaluate("g:fuzzy_ceiling").to_i
      ignore = VIM.evaluate("g:fuzzy_ignore").split(/[;,]/)
      FuzzyFileFinder.new(roots, ceiling, ignore)
    end
  end
RUBY

  let g:FuzzyFinderMode.TextMate = copy(g:FuzzyFinderMode.Base)

  " ================================================================================
  " This function is copied almost whole-sale from fuzzyfinder.vim. Ideally, I could
  " used the on_complete callback to more cleanly add the new behavior, but the
  " TextMate-style completion broke a few of fuzzyfinder.vim's assumptions, and the
  " only way to patch that up was to override Base.complete...which required me to
  " copy-and-paste much of the original implementation.
  "
  " Ugly. But effective.
  " ================================================================================
  function! g:FuzzyFinderMode.TextMate.complete(findstart, base)
    if a:findstart
      return 0
    elseif  !self.exists_prompt(a:base) || len(self.remove_prompt(a:base)) < self.min_length
      return []
    endif
    call s:HighlightPrompt(self.prompt, self.prompt_highlight)

    let result = []

    if exists('g:fuzzy_enumerating_limit')
      let l:limit = g:fuzzy_enumerating_limit
    else
      let l:limit = self.enumerating_limit
    endif

    ruby << RUBY
      text = VIM.evaluate('self.remove_prompt(a:base)')
      limit = VIM.evaluate('l:limit').to_i

      matches = finder.find(text, limit)
      matches.sort_by { |a| [-a[:score], a[:path]] }.each_with_index do |match, index|
        word = match[:path]
        abbr = "%2d: %s" % [index+1, match[:abbr]]
        menu = "[%5d]" % [match[:score] * 10000]
        VIM.evaluate("add(result, { 'word' : #{word.inspect}, 'abbr' : #{abbr.inspect}, 'menu' : #{menu.inspect} })")
      end
RUBY

    if empty(result) || len(result) >= l:limit
      call s:HighlightError()
    endif

    if !empty(result)
      call feedkeys("\<C-p>\<Down>", 'n')
    endif

    return result
  endfunction

  function! FuzzyFinderTextMateLauncher(initial_text, partial_matching)
    call g:FuzzyFinderMode.TextMate.launch(a:initial_text, a:partial_matching)
  endfunction

  function! g:FuzzyFinderMode.TextMate.on_open(expr, mode)
    call s:OpenFile(fnamemodify(a:expr, ':~:.'), a:mode)
  endfunction

  let g:FuzzyFinderOptions.TextMate = copy(g:FuzzyFinderOptions.File)
endfunction "}}}

if !exists('loaded_fuzzyfinder') "{{{
  function! FuzzyFinderTextMateLauncher(initial_text, partial_matching)
    call InstantiateTextMateMode()
    function! FuzzyFinderTextMateLauncher(initial_text, partial_matching)
      call g:FuzzyFinderMode.TextMate.launch(a:initial_text, a:partial_matching)
    endfunction
    call g:FuzzyFinderMode.TextMate.launch(a:initial_text, a:partial_matching)
  endfunction
  finish
end "}}}

call InstantiateTextMateMode()

endif
