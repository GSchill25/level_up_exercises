require 'rails_helper'

RSpec.describe Question, type: :model do
	let(:question) { FactoryGirl.create(:question) }

	it { should validate_presence_of(:body) }

	it { should validate_presence_of(:title) }

	it { should have_one(:answer) }
  
	it { should belong_to(:user) }

  it { should accept_nested_attributes_for(:answer)}

  it "should have a valid factory" do
  	expect(question).to be_valid
  end

  it "should be a question related to ruby" do
  	expect(question.ruby_question).to eq(true)
  	question.tags = "python,django,webapp"
  	expect(question.ruby_question).to eq(false)
  end

  it "should know if it has the current ruby version" do
    expect(question.ruby_version_up_to_date?).to eq(false)
    question.ruby_version = "2.2.2"
    expect(question.ruby_version_up_to_date?).to eq(true)
  end

  it "should know if it has the current rails version" do
    expect(question.rails_version_up_to_date?).to eq(true)
    question.rails_version = "3.8"
    expect(question.rails_version_up_to_date?).to eq(false)
  end
  
end
