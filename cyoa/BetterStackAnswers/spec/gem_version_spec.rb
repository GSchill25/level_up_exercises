require 'gem_version'
require_relative 'rails_helper'

describe StackOverflow do

  it "should have 2 class variables" do
  	expect(GemVersion.ruby).to eq("")
  	expect(GemVersion.rails).to eq("")
  end

  it "should get the current ruby version" do
  	expect(GemVersion.ruby).to eq("")
  	GemVersion.current_ruby_version
  	expect(GemVersion.ruby).not_to eq("")
  end

  it "should get the current rails version" do
  	expect(GemVersion.rails).to eq("")
  	GemVersion.current_rails_version
  	expect(GemVersion.rails).not_to eq("")
  end
end
