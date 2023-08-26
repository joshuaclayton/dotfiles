def benchmark
  t1 = Time.now
  result = yield
  puts "#{(Time.now - t1) * 1000}ms"

  result
end

def benchmark_average(times = 20)
  average = []
  times.times do
    average << benchmark do
      yield
    end.to_f
  end
  "#{average.inject { |sum, item| sum += item } / times.to_f}ms"
end

class MemoryUsage
  def self.kilobytes
    `ps -o rss= -p #{$$}`.to_i
  end
end
