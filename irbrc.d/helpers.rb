def clear_site_logs
  Dir.glob("#{ENV["HOME"]}/Sites/**/log/*.log").each {|log| File.delete(log) }
end

def benchmark
  t1 = Time.now
  yield
  "#{(Time.now - t1) * 1000}ms"
end

class MemoryUsage
  def self.kilobytes
    `ps -o rss= -p #{$$}`.to_i
  end
end