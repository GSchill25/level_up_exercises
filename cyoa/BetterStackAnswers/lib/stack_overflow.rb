require 'httparty'

class StackOverflow
	attr_accessor :answers, :questions, :answer_ids

	include HTTParty

	def initialize
		@answers = {}
		@questions = {}
		@answer_ids = ""
	end

	def stack_answers
		@answer_ids = @answer_ids[0..@answer_ids.length-2]
		@answers = HTTParty.get("https://api.stackexchange.com/2.2/answers/#{@answer_ids}?pagesize=100&order=desc&sort=activity&site=stackoverflow&filter=!)5lu_uJvJu*29XuDV862WD9kVmja")
	end

	def create_answers_from_json
		raise "No answer ids" if @answer_ids.empty?
		@answers["items"].each do |a|
			question = Question.where("question_id = ?", a["question_id"])[0]
			if chance_to_improve(a, question)
				Answer.create(answer_id: a["answer_id"], question_id: question.id, is_accepted: a["is_accepted"], up_vote_count: a["up_vote_count"], link: a["link"], body: a["body"])
			end
		end
	end

	def stack_questions
		time = 1.week.ago.to_time.to_i
		@questions = HTTParty.get("https://api.stackexchange.com/2.2/questions?pagesize=100&todate=#{time}&order=desc&sort=activity&tagged=ruby&site=stackoverflow&filter=!BL6SJ7EwsWfFXwoLNU7IsOZ938AjAp")
	end

	def create_questions_from_json
		@questions["items"].each do |q|
			if accepted_answer(q)
		    tags = q["tags"].join(",") unless tags.nil? || tags.empty?
        @answer_ids += "#{q['accepted_answer_id']};"
        Question.create(accepted_answer_id: q["accepted_answer_id"], question_id: q["question_id"], up_vote_count: q["up_vote_count"], link: q["link"], body: q["body"], tags: tags, title: q["title"], is_answered: q["is_answered"], answer_count: q["answer_count"])
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
		if q["accepted_answer_id"].nil? || q["accepted_answer_id"] == ""
			false
		else
			true
    end
  end
end
