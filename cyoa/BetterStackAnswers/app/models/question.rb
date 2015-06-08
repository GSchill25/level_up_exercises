class Question < ActiveRecord::Base
	include PgSearch
	pg_search_scope :search_by_title, :against => :title

	has_one :answer
	belongs_to :user

  accepts_nested_attributes_for :answer

	validates_presence_of :body, :title
	validate :ruby_question

	def ruby_question
		unless tags.nil? || tags.empty?
			return tags.split(",").include?('ruby')
		end
	end

	def ruby_version_up_to_date?
		Rails.application.config.ruby_version == ruby_version
	end

	def rails_version_up_to_date?
		Rails.application.config.rails_version == rails_version
	end

end
