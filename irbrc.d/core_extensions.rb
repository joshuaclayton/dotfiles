module Enumerable
  def dups
    inject({}) {|h,v| h[v] = h[v].to_i + 1; h }.reject {|k,v| v == 1 }.keys
  end

  def non_dups
    inject({}) {|h,v| h[v] = h[v].to_i + 1; h }.select {|k,v| v == 1 }.keys
  end
end

class File
  def self.file_to_string(path)
    File.new(path).read
  end

  def self.string_to_file(string, path)
    directory = File.dirname(path)
    FileUtils.mkdir_p directory unless File.directory?(directory)
    File.open(path, "w") { |file| file << string }
  end
end

%w(January February March April May June July August September October November December).each_with_index do |month, index|
  Object.send :define_method, month do |day, year|
    Date.parse("#{index + 1}/#{day}/#{year}")
  end
end
