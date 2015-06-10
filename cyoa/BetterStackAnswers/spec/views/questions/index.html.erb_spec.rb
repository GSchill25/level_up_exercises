require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        question_id: 1,
        accepted_answer_id: 2,
        body: "MyText",
        tags: "Tags",
        title: "MyText",
        up_vote_count: 3,
        answer_count: 4,
        is_answered: false,
        link: "MyText"),
      Question.create!(
        question_id: 1,
        accepted_answer_id: 2,
        body: "MyText",
        tags: "Tags",
        title: "MyText",
        up_vote_count: 3,
        answer_count: 4,
        is_answered: false,
        link: "MyText")])
  end

  it "renders a list of questions" do
    allow(view).to receive_messages(will_paginate: nil)
    render
    assert_select "div", text: "MyText".to_s, count: 2
    assert_select "div>div>span", text: "Tags".to_s, count: 2
  end
end
