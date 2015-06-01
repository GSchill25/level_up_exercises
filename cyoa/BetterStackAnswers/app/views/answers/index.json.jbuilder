json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer_id, :question_id, :is_accepted, :up_vote_count, :creation_date, :link, :last_edit_date, :body
  json.url answer_url(answer, format: :json)
end
