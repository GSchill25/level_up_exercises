FactoryGirl.define do
  factory :user do
    name "stackname222"
    revisions 0
    uid "1234567"
    provider "stackexchange"
    picture "https://www.gravatar.com/avatar/51509c8119e8c44d1c642710dbba1b3e?s=128&d=identicon&r=PG&f=1"
  end
end

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
  end
end

FactoryGirl.define do
  factory :answer do
    answer_id 2
    question_id 3
    is_accepted true
    up_vote_count 5
    link "www.stackoverflow.com"
    body "<p>Yes it is blue</p>"
  end
end