json.array!(@questions) do |question|
  json.extract! question, :id, :question_id, :accepted_answer_id, :body, :creation_date, :tags, :title, :up_vote_count, :answer_count, :is_answered, :link
  json.url question_url(question, format: :json)
end
