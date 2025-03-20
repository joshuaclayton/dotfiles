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

class Timer
  def initialize(report_every: 10)
    @report_every = report_every
    @past_minute = []
    @per_minute_average = []
  end

  def time(&block)
    loop do
      count = block.call
      @past_minute.unshift(count)
      per_minute = handled_per_minute
      @per_minute_average.unshift(per_minute)
      puts "Count: #{count} (#{per_minute}/min, #{per_minute_average}/min avg, ~#{minutes_remaining(count)}min remaining)"
      sleep @report_every
    end
  end

  def minutes_remaining(count)
    if per_minute_average > 0
      count / per_minute_average
    else
      0
    end
  end

  def per_minute_average
    array = @per_minute_average.take(past_minute_count)
    if array.length > 0
      array.sum / array.length
    else
      0
    end
  end

  def past_minute_count
    60 / @report_every
  end

  def handled_per_minute
    most_recent = @past_minute.take(past_minute_count)
    most_recent.max - most_recent.min
  end
end
