require 'rails_helper'

RSpec.describe Question, type: :model do
	let(:question) { FactoryGirl.build(:question) }

	it { should validate_presence_of(:is_answered) }

	it { should validate_presence_of(:accepted_answer_id) }

	it { should validate_presence_of(:body) }

	it { should validate_presence_of(:name) }

	it { should validate_presence_of(:title) }

  it "should have a valid factory" do
  	expect(question).to be_valid
  end

  it "should validate the question is answered" do
  	question.is_answered = false
  	expect(question).not_to be_valid
  end

  it "should be a question related to ruby" do
  	expect(question.tags.split(",").include?('ruby')).to eq(true)
  end
end
