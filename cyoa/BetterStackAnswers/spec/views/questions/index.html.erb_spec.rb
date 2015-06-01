require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :question_id => 1,
        :accepted_answer_id => 2,
        :body => "MyText",
        :tags => "Tags",
        :title => "MyText",
        :up_vote_count => 3,
        :answer_count => 4,
        :is_answered => false,
        :link => "MyText"
      ),
      Question.create!(
        :question_id => 1,
        :accepted_answer_id => 2,
        :body => "MyText",
        :tags => "Tags",
        :title => "MyText",
        :up_vote_count => 3,
        :answer_count => 4,
        :is_answered => false,
        :link => "MyText"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
