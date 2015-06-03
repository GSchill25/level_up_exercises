class Question < ActiveRecord::Base
	has_one :answer
	belongs_to :user

	validates_presence_of :is_answered, :accepted_answer_id, :body, :title
	validate :answered?
	validate :ruby_question

	def answered?
		is_answered
	end

	def ruby_question
		unless tags.nil? || tags.empty?
			return tags.split(",").include?('ruby')
		end
	end

end
