class Answer < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :question_id, :body
  validates :up_vote_count, numericality: {only_integer: true, less_than: 10}
end
