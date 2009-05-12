require 'rubygems'

Dir[File.join(File.dirname(__FILE__), ".irb_scripts", "*")].each do |f|
  require f
end

IRB.conf[:PROMPT_MODE] = :SIMPLE