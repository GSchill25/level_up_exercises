require 'rails_helper'

RSpec.describe "answers/show", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :answer_id => 1,
      :question_id => 2,
      :is_accepted => false,
      :up_vote_count => 3,
      :link => "Link",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/MyText/)
  end
end
