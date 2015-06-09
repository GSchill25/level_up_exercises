require 'httparty'

class GemVersion
  include HTTParty

  def self.ruby
  	Rails.application.config.ruby_version
  end

  def self.rails
  	Rails.application.config.rails_version
  end

  def self.current_rails_version
    temp_version = Rails.application.config.rails_version
    Rails.application.config.rails_version = HTTParty.get("https://rubygems.org/api/v1/versions/rails/latest.json")["version"]
    temp_version != Rails.application.config.rails_version
  end

  def self.current_ruby_version
    temp_version = Rails.application.config.ruby_version
  	Rails.application.config.ruby_version = HTTParty.get("https://rubygems.org/api/v1/versions/ruby2ruby/latest.json")["version"]
    temp_version != Rails.application.config.ruby_version
  end
end