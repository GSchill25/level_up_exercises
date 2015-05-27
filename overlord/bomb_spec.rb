require './bomb.rb'

describe Bomb do
  let(:bomb) { Bomb.new }

  it "should have a default active code of 1234" do
    expect(bomb.active_code).to eq("1234")
  end

  it "should have a default deactive code of 0000" do
    expect(bomb.deactive_code).to eq("0000")
  end

  it "should be inactive by default" do
    expect(bomb.active).to eq(false)
  end

  it "should be not exploded by default" do
    expect(bomb.exploded).to eq(false)
  end
  
  it "should be able to update its active code" do
    bomb.set_active_code("5555")
    expect(bomb.active_code).to eq("5555")
  end

  it "should be able to update its deactive code" do
    bomb.set_deactive_code("4242")
    expect(bomb.deactive_code).to eq("4242")
  end

  it "should activate with the proper code" do
    bomb.activate("1234")
    expect(bomb.active).to eq(true)
  end

  it "should deactivate with the proper code" do
    bomb.active = true
    bomb.deactivate("0000")
    expect(bomb.active).to eq(false)
  end

  it "shouldn't activate with an improper code" do
  	expect(bomb.active).to eq(false)
  	bomb.activate("2323")
  	expect(bomb.active).to eq(false)
  end

  it "shouldn't deactivate with an improper code" do
  	bomb.active = true
  	bomb.deactivate("9876")
  	expect(bomb.active).to eq(true)
  end

  it "should explode" do
  	expect(bomb.exploded).to eq(false)
  	bomb.explode
  	expect(bomb.exploded).to eq(true)
  end
end