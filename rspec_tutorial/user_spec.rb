require './user.rb'

describe User do
  it "should be in any roles assigned to it" do
    user = User.new
    user.assign_role("assigned role")
    expect(user).to be_in_role("assigned role")
  end

  it "should NOT be in any roles not assigned to it" do
    user = User.new
    expect(user).not_to be_in_role("unassigned role")
  end
end