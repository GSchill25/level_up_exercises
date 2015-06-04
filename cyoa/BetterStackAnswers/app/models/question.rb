class Question < ActiveRecord::Base
	has_one :answer
	belongs_to :user

	validates_presence_of :accepted_answer_id, :body, :title
	validate :ruby_question

	def ruby_question
		unless tags.nil? || tags.empty?
			return tags.split(",").include?('ruby')
		end
	end

end
