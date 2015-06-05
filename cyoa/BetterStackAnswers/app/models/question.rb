class Question < ActiveRecord::Base
	has_one :answer
	belongs_to :user

  accepts_nested_attributes_for :answer

	validates_presence_of :accepted_answer_id, :body, :title
	validate :ruby_question

	def ruby_question
		unless tags.nil? || tags.empty?
			return tags.split(",").include?('ruby')
		end
	end

end
