require 'rails_helper'

RSpec.describe Question, type: :model do
	let(:question) { FactoryGirl.create(:question) }

	it { should validate_presence_of(:is_answered) }

	it { should validate_presence_of(:accepted_answer_id) }

	it { should validate_presence_of(:body) }

	it { should validate_presence_of(:title) }

	it { should have_one(:answer) }
	it { should belong_to(:user) }

  it "should have a valid factory" do
  	expect(question).to be_valid
  end

  it "should validate the question is answered" do
  	question.is_answered = false
  	expect(question.answered?).to eq(question.is_answered)
  	expect(question).not_to be_valid
  end

  it "should be a question related to ruby" do
  	expect(question.ruby_question).to eq(true)
  	question.tags = "python,django,webapp"
  	expect(question.ruby_question).to eq(false)
  end
end
