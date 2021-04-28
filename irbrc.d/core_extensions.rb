module Enumerable
  def dups
    each_with_object({}) { |v, h| h[v] = h[v].to_i + 1; }.reject { |k, v| v == 1 }.keys
  end

  def non_dups
    each_with_object({}) { |v, h| h[v] = h[v].to_i + 1; }.select { |k, v| v == 1 }.keys
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
