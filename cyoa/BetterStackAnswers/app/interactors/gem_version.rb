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
    req = HTTParty.get("https://rubygems.org/api/v1/"\
                       "versions/rails/latest.json")
    Rails.application.config.rails_version = req["version"]
    temp_version != Rails.application.config.rails_version
  end

  def self.current_ruby_version
    temp_version = Rails.application.config.ruby_version
    req = HTTParty.get("https://rubygems.org/api/v1/"\
                       "versions/ruby2ruby/latest.json")
    Rails.application.config.ruby_version = req["version"]
    temp_version != Rails.application.config.ruby_version
  end
end
