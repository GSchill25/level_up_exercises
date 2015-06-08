require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { FactoryGirl.create(:answer) }

	it { should validate_numericality_of(:up_vote_count) }

	it { should belong_to(:question) }

	it "should have a valid factory" do
  	expect(answer).to be_valid
  end

	it "should have an up vote count less than 10" do
		answer.up_vote_count = 10
		expect(answer).not_to be_valid
	end

	it "should require a valid question_id on update" do
	  answer.question_id = ""
	  expect(answer).not_to be_valid
	end
end
