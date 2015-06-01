require 'httparty'

class StackOverflow
	attr_accessor :answers, :questions, :question_ids

	include HTTParty

	def initialize
		@answers = {}
		@questions = {}
		@question_ids = ""
	end

	def stack_answers
		@question_ids = @question_ids[0..@question_ids.length-2]
		@answers = HTTParty.get("https://api.stackexchange.com/2.2/questions/#{@question_ids}/answers?pagesize=100&order=desc&sort=activity&site=stackoverflow&filter=!0X*TZmuKc)P5p1j0KXEW2tnY5")
	end

	def create_answers_from_json
		@answers["items"].each do |a|
			question = Question.where("question_id = ?", a["question_id"])[0]
			if chance_to_improve(a, question)
				Answer.create(answer_id: a["answer_id"], question_id: question.id, is_accepted: a["is_accepted"], up_vote_count: a["up_vote_count"], creation_date: a["creation_date"], link: a["link"], last_edit_date: a["last_edit_date"], body: a["body"])
			end
		end
	end

	def stack_questions
		time = 1.week.ago.to_time.to_i
		@questions = HTTParty.get("https://api.stackexchange.com/2.2/questions?pagesize=100&todate=#{time}&order=desc&sort=activity&tagged=ruby&site=stackoverflow&filter=!*e9ibzBtKuuwgwd7CXx(XaTsPIb2n9_0qHdVm")
	end

	def create_questions_from_json
		@questions["items"].each do |q|
			if accepted_answer(q)
			  tags = q["tags"].join(",")
			  @question_ids += "#{q['question_id']};"
			  Question.create(accepted_answer_id: q["accepted_answer_id"], question_id: q["question_id"], up_vote_count: q["up_vote_count"], creation_date: q["creation_date"], link: q["link"], body: q["body"], tags: tags, title: q["title"], is_answered: q["is_answered"], answer_count: q["answer_count"])
			end
		end
	end

	def chance_to_improve(a, question)
		if a["up_vote_count"] < 10
			true
		else
			question.destroy
			false
		end
	end

	def accepted_answer(q)
		q["accepted_answer_id"].nil? ? false : true
	end
end
