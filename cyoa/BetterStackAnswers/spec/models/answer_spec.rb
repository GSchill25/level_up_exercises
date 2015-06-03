require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { FactoryGirl.create(:answer) }

	it { should validate_presence_of(:question_id) }

	it { should validate_presence_of(:body) }

	it { should belong_to(:question) }

	it "should have a valid factory" do
  	expect(answer).to be_valid
  end

	it "should have an up vote count less than 10" do
		answer.up_vote_count = 10
		expect(answer).not_to be_valid
	end
end
