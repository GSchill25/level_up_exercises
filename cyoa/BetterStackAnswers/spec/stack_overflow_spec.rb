require '../lib/stack_overflow.rb'

describe StackOverflow do
	let(:stack_overflow) { StackOverflow.new }

	it "should initialize with an empty hash called answers" do
	  expect(stack_overflow.answers).to eq({})
	end

	it "should get stack overflow answers" do
		stack_overflow.stack_answers
		expect(stack_overflow.answers).not_to eq({})
	end
end
