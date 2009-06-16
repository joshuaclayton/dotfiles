" functions
function! SpecDescribed()
  let curline = line(".")
  let curcol  = col(".")
  let line = search("describe", "bW")
  if line > 0
    let line = getline(line)
    let subject = substitute(matchstr(line, "describe [^, ]*"), "^describe ", "", "")
    call cursor(curline, curcol)
    return subject
  else
    return 'subject'
  endif
endfunction

function! SpecSubject()
  return "@" . rails#underscore(SpecDescribed())
endfunction

function! IterVar(collection)
  let collection = substitute(a:collection,"^@","","")
  return rails#singularize(collection)
endfunction

" general ruby snippets
Snippet each <{collection}>.each do |<{collection:IterVar(@z)}>|<CR><{}><CR>end
Snippet collect <{collection}>.collect {|<{member}>| <{}> }

" active record associations
Snippet bt belongs_to :<{}>
Snippet ho has_one :<{}>
Snippet hm has_many :<{}>
Snippet habtm has_and_belongs_to_many :<{}>
Snippet hmt has_many :<{association}>, :through => <{}>

" active record validations
Snippet vpo validates_presence_of :<{attribute}><{}>
Snippet vpos validates_presence_of :<{attribute}>, :scope => <{scope}><CR><{}>

" shoulda validation macros
Snippet shal should_allow_values_for :<{attribute}>, <{}>
Snippet should_ensure_length_at_least should_ensure_length_at_least :<{attribute}>, <{length}><CR><{}>
Snippet should_ensure_length_in_range  should_ensure_length_in_range :<{attribute}>, <{range}><CR><{}>
Snippet should_ensure_length_is should_ensure_length_is :<{attribute}>, <{length}><CR><{}>
Snippet should_ensure_value_in_range should_ensure_value_in_range :<{attribute}>, <{range}><CR><{}>
Snippet shnal should_not_allow_values_for :<{attribute}>, <{}>
Snippet shalnum should_only_allow_numeric_values_for :<{}>
Snippet shprot should_protect_attributes :<{}>
Snippet shreqacc should_require_acceptance_of :<{}>
Snippet shreq should_require_attributes :<{}>
Snippet shrequniq should_require_unique_attributes :<{}>

" Factory girl
Snippet F Factory(:<{factory}>)<{}>
Snippet Fb Factory.build(:<{factory}>)<{}>
Snippet Fw Factory(:<{factory}>, :<{}>)
Snippet Fbw Factory.build(:<{factory}>, :<{}>)

" shoulda association macros
Snippet shbt should_belong_to :<{association}><CR><{}>
Snippet shhabtm should_have_and_belong_to_many :<{association}><CR><{}>
Snippet shhm should_have_many :<{association}><CR><{}>
Snippet shho should_have_one :<{association}><CR><{}>

" shoulda controller macros
Snippet shass should_assign_to :<{}>
Snippet shnass should_not_assign_to :<{}>
Snippet shnfl should_not_set_the_flash<{}>
Snippet shred should_redirect_to "<{}>"
Snippet shrend should_render_template :<{}>
Snippet shlay should_render_without_layout :<{}>
Snippet shres should_respond_with :<{}>
Snippet shroute should_route :<{method}>, "<{path}>", :action => :<{}>
Snippet shfl should_set_the_flash_to /<{}>/i

" shoulda contexts
Snippet cont context "<{description}>" do<CR>setup do<CR><{}><CR>end<CR>end
Snippet sh should "<{description}>" do<CR><{}><CR>end

"rspec
Snippet desc describe <{class}>, "<{description}>" do<CR>before do<CR><{}><CR>end<CR>end
Snippet descn describe <{class}> do<CR>before do<CR><{}><CR>end<CR>end
Snippet descs describe "<{description}>" do<CR>before do<CR><{}><CR>end<CR>end
Snippet it it "should <{description}>" do<CR><{}><CR>end
Snippet itsh it "should <{description}>" do<CR>``SpecSubject()``.should <{}><CR>end
Snippet itshbe it "should <{description}>" do<CR>``SpecSubject()``.should be_<{}><CR>end
Snippet atsh it "should <{description}>" do<CR>``SpecSubject()``.<{attr}>.should <{}><CR>end
Snippet atshbe it "should <{description}>" do<CR>``SpecSubject()``.<{attr}>.should be_<{}><CR>end
Snippet sheq should == <{}>
Snippet spechelper require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')<{}>

" rspec-rails
Snippet itres it { response.should be_<{}> }
Snippet itrend it { response.should render_template(:<{}>) }
Snippet itred it { response.should redirect_to(<{}>) }

"" rspec-rr
Snippet shrec should have_received.<{}>

" mocha
Snippet stubs stubs(:<{method}>).returns(<{result}>)
Snippet expects expects(:<{method}>).with(<{params}>).returns(<{result}>)<{}>
Snippet expectse expects(:<{method}>).with().returns(<{result}>)<{}>

" assertions
Snippet as assert <{}>
Snippet ase assert_equal <{expected}>, <{}>
Snippet asne assert_not_equal <{unexpected}>, <{}>
Snippet asn assert_nil <{}>
Snippet asnn assert_not_nil <{}>
Snippet asm assert_match <{expected}>, <{}>
Snippet asnm assert_match <{unexpected}>, <{}>

" render
Snippet renda render :action => '<{}>'
Snippet rendn render :nothing => true<{}>
Snippet rendf render :file => '<{}>'
Snippet rendt render :template => '<{}>'
Snippet rendl render :layout => '<{}>'

" Cucumber step definitions
Snippet Given Given /^<{step}>$/ do<{}><CR>end
Snippet When When /^<{step}>$/ do<{}><CR>end
Snippet Then Then /^<{step}>$/ do<{}><CR>end
