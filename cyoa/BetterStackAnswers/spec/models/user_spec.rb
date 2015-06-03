require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:uid) }

  it { should validate_presence_of(:provider) }

  it { should have_many(:questions) }

  it "should have a valid factory" do
  	expect(FactoryGirl.build(:user)).to be_valid
  end
end
