require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a valid factory" do
  	expect(FactoryGirl.build(:user)).to be_valid
  end

  it "should require users to have a name" do
  	expect(FactoryGirl.build(:user, name: "")).not_to be_valid
  end

  it "should require users to have a uid" do
  	expect(FactoryGirl.build(:user, uid: "")).not_to be_valid
  end

  it "should require users to have a provider" do
  	expect(FactoryGirl.build(:user, provider: "")).not_to be_valid
  end
  
end
