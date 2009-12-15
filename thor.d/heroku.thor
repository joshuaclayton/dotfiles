#!/usr/bin/env ruby

class Heroku < Thor
  desc "switch <email> <password>", ""
  def switch(email, password)
    `heroku keys:clear`
    path = File.join(ENV["HOME"], ".heroku", "credentials")
    string = "#{email}\n#{password}"
    File.open(path, "w") { |file| file << string }
    `heroku keys:add`
  end
end
