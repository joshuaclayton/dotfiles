function! ShouldaReplaceEach(macro, template)
  let lineno = search(a:macro, "wnc")
  if lineno > 0
    let line = getline(lineno)
    while match(line, ",\\s*$") != -1
      execute lineno . "," . (lineno + 1) . "join"
      let line = getline(lineno)
    endwhile
    let attrs = matchlist(line, "^\\(\\s\\+\\)" . a:macro . " \\(.*\\)")
    let lead = attrs[1]
    let attrs = split(attrs[2], ",\\s*")
    let replace = 1
    for attr in attrs
      if attr != ""
        let result = lead . substitute(a:template, "%s", attr, "")
        if replace
          let replace = 0
          call setline(lineno, result)
        else
          call append(lineno, result)
        endif
      endif
    endfor
  endif
endfunction

function! ToRSpec()
  " Remove trailing space
  silent! %s/\s\+$//g

  " Context
  silent! %s/^\(\s\+\)context /\1describe /
  silent! %s/^\(\s\+\)setup /\1before /
  silent! %s/^\(\s\+\)teardown /\1after /
  silent! %s/^\(\s\+\)should \"/\1it \"should /
  silent! %s/^\(\s\+\)def setup\s*$/\1before do/
  silent! %s/^\(\s\+\)def teardown\s*$/\1after do/

  " Macros
  silent! %s/should_set_the_flash_to \(.*\)/it { should set_the_flash.to(\1) }/
  silent! %s/should_set_the_flash_to(\(.*\))/it { should set_the_flash.to(\1) }/
  silent! %s/should_not_set_the_flash/it { should_not set_the_flash }/
  silent! %s/should_respond_with \(.*\)/it { should respond_with(\1) }/
  silent! %s/should_render_template \(.*\)/it { should render_template(\1) }/
  silent! %s/should_route \([:a-z]\+\), \([^,]\+\), \(.\+\)/it { should route(\1, \2).to(\3) }/
  silent! %s/\(\s*\)should_allow_values_for\s*\([^,]\+\), \([^,]*,.*\)/\1[\3].each do |value|\1  it { should allow_value(value).for(\2) }\1end/
  silent! %s/should_allow_values_for\s*\([^,]\+\), \(.*\)/it { should allow_value(\2).for(\1) }/
  silent! %s/\(\s*\)should_not_allow_values_for\s*\([^,]\+\), \([^,]*,.*\)/\1[\3].each do |value|\1  it { should_not allow_value(value).for(\2) }\1end/
  silent! %s/should_not_allow_values_for\s*\([^,]\+\), \(.*\)/it { should_not allow_value(\2).for(\1) }/
  silent! %s/^\(\s*\)should_redirect_to(['"]\(.*\)['"]) { \(.*\) }/\1it "should redirect to \2" do\1  should redirect_to(\3)\1end/
  call ShouldaReplaceEach("should_filter_params", "it { should filter_param(%s) }")
  call ShouldaReplaceEach("should_validate_presence_of", "it { should validate_presence_of(%s) }")
  call ShouldaReplaceEach("should_validate_uniqueness_of", "it { should validate_uniqueness_of(%s) }")
  call ShouldaReplaceEach("should_not_allow_mass_assignment_of", "it { should_not allow_mass_assignment_of(%s) }")

  " Assertions
  silent! %s/assert ! \?\(.*\)\.\(\w\+\)?$/\1.should_not be_\2/
  silent! %s/assert \(.*\)\.\(\w\+\)?$/\1.should be_\2/
  silent! %s/assert \(.*\)\.include?(\([^)]*\))/\1.should include(\2)/
  silent! %s/assert ! \?\(.*\)/(\1).should_not be/
  silent! %s/assert \(.*\)/(\1).should be/
  silent! %s/assert_nil \(.*\)/\1.should be_nil/
  silent! %s/\(\s*\)assert_not_nil \(.*\) = \(.*\)/\1\2 = \3\1\2.should_not be_nil/
  silent! %s/assert_not_nil \(.*\)/\1.should_not be_nil/
  silent! %s/assert_equal \([^,]*\), \([^,]*\)$/\2.should == \1/
  silent! %s/assert_not_equal \([^,]*\), \([^,]*\)$/\2.should_not == \1/
  silent! %s/assert_match \([^,]*\), \([^,]*\)/\2.should =\~ \1/
  silent! %s/assert_kind_of \([^,]*\), \([^,]*\)/\2.should be_kind_of(\1)/
  silent! %s/assert_received(\([^)]\+\)) {[^ ]\+ [^\.]\+.\(.*\) }/\1.should have_received.\2/

  " Top-level classes
  silent! %s/class \(\w\+\)Test < Test::Unit::TestCase/describe \1 do/

  " Highlight unreplaced macros/assertions
  highlight tunit ctermbg=red guibg=red
  call matchadd("tunit", "assert\\w*")
  call matchadd("tunit", "should_\\(not \\|behave_like\\)\\@!\\w*")
  call search("assert", "wc")
  call search("should_", "wc")
endfunction

command! ToRSpec call ToRSpec()
