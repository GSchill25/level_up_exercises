FactoryGirl.define do
  factory :question do
    question_id 1
    accepted_answer_id 1
    body "<p>Is the sky blue?</p>"
    tags "ruby,rails"
    title "Sky Color"
    up_vote_count 3
    answer_count 2
    is_answered true
    link "www.stackoverflow.com"
    ruby_version "2.0"
    rails_version "4.2"
  end
end
