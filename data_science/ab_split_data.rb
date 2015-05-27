require 'json'
require 'abanalyzer'

class Cohort
  attr_accessor :conversions, :samples, :key

  def initialize(conversions, k)
    @samples = conversions[k][:yes] + conversions[k][:no]
    @key = k
    @conversions = conversions
  end

  def conversion_rate
    conversions[key][:yes] / samples.to_f
  end

  def confidence_interval
    ci = ABAnalyzer.confidence_interval(conversions[key][:yes], samples, 0.95)
    ci.map { |i| i.round(3) }
  end
end

class AbSplitData
  attr_accessor :ab_data

  def initialize(ab_data)
    @ab_data = ab_data
  end

  def chi_squared_test
    combined_data = {}
    #inject
    ab_data.each do |c|
      combined_data[c.key] = c.conversions[c.key]
    end
    tester = ABAnalyzer::ABTest.new combined_data
    tester.chisquare_p.round(5)
  end

  def run_stats
    ab_data.each do |c|
      puts "Cohort #{c.key}"
      puts "Conversion Rate: #{c.conversion_rate.round(3)}"
      puts "C.I.: #{c.confidence_interval[0]}, #{c.confidence_interval[1]}"
    end
    puts "Chi-Squared Test: #{chi_squared_test}"
  end
end

class JsonParser
  attr_accessor :data, :cohorts

  def initialize
    @data = {}
    @cohorts = []
  end

  def read_json_data(link)
    file = File.read(link)
    @data = JSON.parse(file)
  end

  def create_cohorts
    cohort_conversions.each do |cohort, samples|
      cohorts << Cohort.new({ cohort => samples }, cohort)
    end
  end

  def cohort_conversions
    conversions = {}
    #inject
    @data.each do |d|
      unless conversions.key?(d["cohort"])
        conversions[d["cohort"]] = { yes: 0, no: 0 }
      end
      if d["result"] == 1
        conversions[d["cohort"]][:yes] += 1
      else
        conversions[d["cohort"]][:no] += 1
      end
    end
    conversions
  end
end

# Example Usage
j = JsonParser.new
j.read_json_data("data_export_2014_06_20_15_59_02.json")
j.create_cohorts

ab = AbSplitData.new(j.cohorts)
ab.run_stats
