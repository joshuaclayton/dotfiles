class Snip
  class SnippetNotFoundError < StandardError; end
  
  @@snips = {}
  
  def self.create(name, &blk)
    @@snips[name.to_s] = blk
    @@snips.keys
  end
  
  def self.[](name)
    raise SnippetNotFoundError, "the snippet '#{name.to_s}' was not found" unless @@snips.has_key?(name.to_s)
    @@snips[name.to_s].call
  end
  
  def self.clear
    @@snips.clear
  end
  
  def self.snips
    @@snips
  end
end

class Object
  def snip(name, &blk)
    if block_given?
      Snip.create(name, &blk)
    else
      Snip[name]
    end
  end
end