require './ab_split_data'

describe AbSplitData do
    # let
    before(:each) do
    @j = JsonParser.new
    @j.read_json_data("ab_split_test_data.json")
    @j.create_cohorts
    @ab_data = AbSplitData.new(@j.cohorts)
    @cohort_a = Cohort.new({ "A" => { yes: 8, no: 16 } }, "A")
    @cohort_b = Cohort.new({ "B" => { yes: 5, no: 25 } }, "B")
  end

  it "should return the sample size" do
    expect(@cohort_a.samples).to eq(24)
    expect(@cohort_b.samples).to eq(30)
  end

  it "should return the number of conversions for a cohort" do
    expect(@cohort_a.conversions).to eq("A" => { yes: 8, no: 16 })
    expect(@cohort_b.conversions).to eq("B" => { yes: 5, no: 25 })
  end

  it "should calculate the conversion rate for a cohort" do
    expect(@cohort_a.conversion_rate.round(3)).to eq(0.333)
    expect(@cohort_b.conversion_rate.round(3)).to eq(0.167)
  end

  it "should find the conversion rate for each cohort with standard error" do
    expect(@cohort_a.confidence_interval).to eq([0.145, 0.522])
    expect(@cohort_b.confidence_interval).to eq([0.033, 0.300])
  end

  it "should calculate a chi-square confidence level" do
    expect(@ab_data.chi_squared_test).to eq(0.1546)
  end

  it "should create two cohorts" do
    expect(@j.cohorts.length).to eq(2)
  end
end
