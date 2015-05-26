require 'csv'

class Dinosaur
  attr_accessor :name, :period, :continent, :diet, :weight, :walking, :description

  def initialize(args = {})
    args.each { |key, value| send "#{key}=", value }
  end

  def carnivore(affirm)
    carni_terms = %w(Carnivore Piscavore Insectivore)
    affirm == "yes" ? carni_terms.include?(diet) : !carni_terms.include?(diet)
  end

  def period(era)
    @period =~ /#{era}/
  end

  def biped(affirm)
    affirm == "yes" ? walking == "Biped" : walking != "Biped"
  end

  def dino_by_name(given_name)
    name == given_name
  end

  def size(big_or_small)
    return false if weight.nil?
    weight.to_i > 4000 ? "big" == big_or_small : "small" == big_or_small
  end
end

class Dinodex
  attr_accessor :dinos

  def initialize
    @dinos = []
  end

  def search(queries = {})
    results = dinos
    queries.each do |descriptor, value|
      results = results.select { |d| d.send(descriptor, value) }
    end
    results.each do |r|
      output(r)
    end
  end

  def output(result)
  #   output = ''
  #   attributes = ['name', 'period', 'continent', 'diet', 'weight', 'walking', 'description']
  #   attributes.each do |d|
  #     output += "#{d}:" + result.name if result.name
  #   end
  #   puts output
    puts result
  end
end

class CsvParser
  attr_accessor :dinos

  def initialize
    @dinos = []
  end

  def read_dinosaur_csv(link)
    CSV.foreach(link, headers: true, converters: :all) do |row|
      dinos << Dinosaur.new(name: row["NAME"], period: row["PERIOD"], continent: row["CONTINENT"], diet: row["DIET"], weight: row["WEIGHT_IN_LBS"], walking: row["WALKING"], description: row["DESCRIPTION"])
    end
  end

  def read_african_dinosaur_csv(link)
    CSV.foreach(link, headers: true, converters: :all) do |row|
      dinos << Dinosaur.new(name: row["Genus"], period: row["Period"], continent: row["Continent"], diet: row["Diet"], weight: row["Weight"], walking: row["Walking"], description: nil)
    end
  end

  def get_dinos
    dinos
  end
end

c = CsvParser.new
d = Dinodex.new
c.read_dinosaur_csv("dinodex.csv")
c.read_dinosaur_csv("african_dinosaur_export.csv")
d.dinos = c.get_dinos
#any way to pass a boolean?
d.search({"biped": "yes", "size": "small"})
d.search({"carnivore": "yes", "size": "small", "biped": "yes" })
d.search({"period": "Cretaceous"})
d.search({"dino_by_name": "Yangchuanosaurus"})
