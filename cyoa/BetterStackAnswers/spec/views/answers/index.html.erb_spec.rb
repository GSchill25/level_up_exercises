require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        :answer_id => 1,
        :question_id => 2,
        :is_accepted => false,
        :up_vote_count => 3,
        :link => "Link",
        :body => "MyText"
      ),
      Answer.create!(
        :answer_id => 1,
        :question_id => 2,
        :is_accepted => false,
        :up_vote_count => 3,
        :link => "Link",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
