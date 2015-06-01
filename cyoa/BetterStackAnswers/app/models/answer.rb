class Answer < ActiveRecord::Base

	def create_from_json(answers)
		answers[:items].each do |a|
			tags = a[:tags].join(",")
			Answer.create(answer_id: a[:answer_id], question_id: a[:question_id], is_accepted: a[:is_accepted], up_vote_count: a[:up_vote_count], creation_date: a[:creation_date], link: a[:link], last_edit_date: a[:last_edit_date], body: a[:body], tags: tags)
		end
	end

end
