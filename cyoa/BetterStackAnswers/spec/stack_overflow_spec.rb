require '../lib/stack_overflow.rb'
require_relative 'rails_helper'

describe StackOverflow do
	let(:stack_overflow) { StackOverflow.new }

	it "should initialize with 3 instance variables" do
	  expect(stack_overflow.answers).to eq({})
	  expect(stack_overflow.questions).to eq({})
	  expect(stack_overflow.answer_ids).to eq("")
	end

	it "should get stack overflow questions" do
		stack_overflow.stack_questions
		expect(stack_overflow.questions).not_to eq({})
	end

	it "should get stack overflow answers" do
		stack_overflow.stack_answers
		expect(stack_overflow.answers).not_to eq({})
	end

	it "should create questions from the json" do
		expect(Question.all.count).to eq(0)
		stack_overflow.stack_questions
		stack_overflow.create_questions_from_json
		expect(Question.all.count).to be > 0
	end

	it "should not create answers without corresponding questions" do
		expect(Answer.all.count).to eq(0)
		stack_overflow.stack_answers
		expect { stack_overflow.create_answers_from_json }.to raise_error
	end

	it "should create one accepted answer for each question" do
		expect(Answer.all.count).to eq(0)
		stack_overflow.stack_questions
		stack_overflow.create_questions_from_json
		stack_overflow.stack_answers
		stack_overflow.create_answers_from_json
		expect(Answer.all.count).to eq(Question.all.count)
	end
end
