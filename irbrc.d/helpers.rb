def clear_site_logs
  Dir.glob("#{ENV["HOME"]}/Sites/**/log/*.log").each {|log| File.delete(log) }
end

def benchmark
  t1 = Time.now
  yield
  "#{(Time.now - t1) * 1000}ms"
end

def benchmark_average(times = 20)
  average = []
  times.times do
    average << benchmark do
      yield
    end.to_f
  end
  "#{average.inject {|sum, item| sum += item }/times.to_f}ms"
end

class MemoryUsage
  def self.kilobytes
    `ps -o rss= -p #{$$}`.to_i
  end
end

def load_fg
  require "factory_girl"
  Factory.find_definitions
end
