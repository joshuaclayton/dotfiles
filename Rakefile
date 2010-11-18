def stop_error(message)
  puts "ERROR: #{message}"
  exit 1
end

def symlink(target, link)
  puts "Linking #{link} => #{target}"
  if File.symlink?(link)
    puts "  * deleting existing symlink #{link}"
    File.unlink(link)
  elsif File.exist?(link)
    stop_error("File exists: #{link}")
  end
  File.symlink(target, link)
  puts
end

def target_path(file)
  File.join(ENV["HOME"], ".#{file}")
end

def existing_path(file)
  File.join(File.dirname(__FILE__), file)
end

files = %w(ackrc gemrc vimrc vim irbrc irbrc.d inputrc zlogin zshrc
           zsh_profile.d aliases tmux.conf zshenv muttrc offlineimaprc)

desc "Install all dotfiles"
task :install do
  `git submodule init`
  `git submodule update`
  files.each do |file|
    symlink(existing_path(file), target_path(file))
  end
end

desc "Remove all dotfies"
task :uninstall do
  files.each do |file|
    File.unlink(target_path(file)) if File.symlink?(target_path(file))
  end
end
