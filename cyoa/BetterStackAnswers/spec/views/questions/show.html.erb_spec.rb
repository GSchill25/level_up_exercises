require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :question_id => 1,
      :accepted_answer_id => 2,
      :body => "MyText",
      :tags => "Tags",
      :title => "MyText",
      :up_vote_count => 3,
      :answer_count => 4,
      :is_answered => false,
      :link => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Tags/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
