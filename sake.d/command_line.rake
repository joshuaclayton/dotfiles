task :delete_swp_files do
  prefixes, swp_files = [".*", "", "*"], []

  prefixes.each do |prefix|
    swp_files += Dir.glob("#{`pwd`.strip}/**/#{prefix}.sw[op]")
  end

  swp_files.each do |file|
    puts "Deleting #{file}"
    File.delete(file)
  end
end
