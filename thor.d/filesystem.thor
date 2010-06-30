#!/usr/bin/env ruby

class FileSystem < Thor
  desc "clean_swp", "clean all .sw[nop] files from pwd and sub directories"
  def clean_swp
    prefixes, swp_files = [".*", "", "*"], []

    prefixes.each do |prefix|
      swp_files += Dir.glob("#{`pwd`.strip}/**/#{prefix}.sw[nop]")
    end

    swp_files.each do |swp_file|
      puts "Deleting #{swp_file}"
      File.delete(swp_file)
    end
  end

  desc "clear_site_logs", "clean out log files within the ~/dev directory"
  def clear_site_logs
    Dir.glob("#{ENV["HOME"]}/dev/**/log/*.log").each do |log_file|
      puts "Deleting #{log_file}"
      File.delete(log_file)
    end
  end
end
