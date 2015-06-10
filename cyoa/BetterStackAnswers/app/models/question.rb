class Question < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_title, against: :title

  has_one :answer
  belongs_to :user

  accepts_nested_attributes_for :answer

  validates_presence_of :body, :title
  validate :ruby_question

  scope :outdated, -> { where(version_updated: false) }
  scope :up_to_date, -> { where(version_updated: true) }

  def ruby_question
    tags.split(",").include?('ruby') unless tags.nil? || tags.empty?
  end

  def ruby_version_up_to_date?
    Rails.application.config.ruby_version == ruby_version
  end

  def rails_version_up_to_date?
    Rails.application.config.rails_version == rails_version
  end

  def self.stack_overflow_questions_and_answers
    request = StackOverflow.new
    request.stack_questions
    request.create_questions_from_json
    request.stack_answers
    request.create_answers_from_json
  end
end
