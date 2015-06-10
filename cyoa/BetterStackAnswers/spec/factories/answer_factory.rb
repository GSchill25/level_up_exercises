FactoryGirl.define do
  factory :answer do
    answer_id 1
    association :question
    is_accepted true
    link "www.stackoverflow.com"
    body "<p>Yes it is blue</p>"
    up_vote_count 3
  end
end
