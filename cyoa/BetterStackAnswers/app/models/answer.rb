class Answer < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :question_id, on: :update
  validates :up_vote_count, numericality: {only_integer: true, less_than: 10, allow_blank: true}
end
