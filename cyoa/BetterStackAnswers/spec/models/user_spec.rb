require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:uid) }

  it { should validate_presence_of(:provider) }

  it { should have_many(:questions) }

  it "should have a valid factory" do
    expect(user).to be_valid
  end

  it "should set all user question version_update to false" do
    FactoryGirl.create(:question, user_id: user.id, version_updated: true)
    FactoryGirl.create(:question, user_id: user.id, title: "New T")
    user.version_change
    user.questions.each do |q|
      expect(q.version_updated).to eq(false)
    end
  end
end
