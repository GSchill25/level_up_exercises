require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      :answer_id => 1,
      :question_id => 1,
      :is_accepted => false,
      :up_vote_count => 1,
      :link => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_answer_id[name=?]", "answer[answer_id]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_is_accepted[name=?]", "answer[is_accepted]"

      assert_select "input#answer_up_vote_count[name=?]", "answer[up_vote_count]"

      assert_select "input#answer_link[name=?]", "answer[link]"

      assert_select "textarea#answer_body[name=?]", "answer[body]"
    end
  end
end
