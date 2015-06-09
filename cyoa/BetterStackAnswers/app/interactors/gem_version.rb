require 'httparty'

class GemVersion
  include HTTParty

  @@ruby = ""
  @@rails = ""

  def self.ruby
  	@@ruby
  end

  def self.rails
  	@@rails
  end

  def self.current_rails_version
    @@rails = HTTParty.get("https://rubygems.org/api/v1/versions/rails/latest.json")["version"]
  end

  def self.current_ruby_version
  	@@ruby = HTTParty.get("https://rubygems.org/api/v1/versions/ruby2ruby/latest.json")["version"]
  end
end