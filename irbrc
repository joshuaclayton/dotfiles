require "rubygems"
require "irb/completion"
require_relative "irbrc.d/core_extensions"
require_relative "irbrc.d/helpers"

IRB.conf[:SAVE_HISTORY] = 40000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_COLORIZE] = true
IRB.conf[:USE_MULTILINE] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
