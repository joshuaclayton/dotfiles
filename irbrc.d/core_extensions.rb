module Enumerable
  def dups
    inject({}) {|h,v| h[v] = h[v].to_i + 1; h }.reject{|k,v| v==1 }.keys
  end
end

class File
  def self.file_to_string(path)
    File.new(path).read
  end

  def self.string_to_file(string, path)
    directory = File.dirname(path)
    FileUtils.mkdir_p directory unless File.directory?(directory)
    File.open(path, 'w') { |f| f << string }
  end
end
