require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      question_id: 1,
      accepted_answer_id: 1,
      body: "MyText",
      tags: "MyString",
      title: "MyText",
      up_vote_count: 1,
      answer_count: 1,
      is_answered: false,
      link: "MyText"))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "textarea#question_body[name=?]", "question[body]"

      assert_select "input#question_tags[name=?]", "question[tags]"

      assert_select "textarea#question_title[name=?]", "question[title]"

      assert_select "input#question_up_vote_count[name=?]", "question[up_vote_count]"

      assert_select "textarea#question_link[name=?]", "question[link]"
    end
  end
end
