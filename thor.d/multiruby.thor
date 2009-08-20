#!/usr/bin/env ruby

class Multiruby < Thor
  desc "test_plugin", "Run tests in current plugin against multiruby"
  def test_plugin
    default_ruby_flags = "-w -I#{%w(lib test).join(File::PATH_SEPARATOR)}"
    cmd = %(#{default_ruby_flags} -e "Dir.glob('test/*_test.rb').each {|f| require f }")
    system "multiruby #{cmd}"
  end
end
