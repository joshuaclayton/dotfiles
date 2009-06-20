require 'rubygems'

def require_rb_files_from(dir)
  Dir.glob(File.join(dir, '*.rb')) do |file|
    require file
  end
end

require_rb_files_from(File.join(ENV['HOME'], '.irb_scripts.d'))

IRB.conf[:PROMPT_MODE] = :SIMPLE
