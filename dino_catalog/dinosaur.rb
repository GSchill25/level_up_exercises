require 'csv'

#attr accessor.. get rid of @'s
#dino class

class Dinodex
  @@dinolog

  def initialize
  	@@dinolog = []
  	@search = []
  end

  def read_dinosaur_csv(link)
    CSV.foreach(link, headers: true) do |row|
  	  @@dinolog << row.to_hash
  	end
  end

  def read_african_dinosaur_csv(link)
  	#csv header converters
    CSV.foreach('african_dinosaur_export.csv', headers: true) do |row|
  	  if row["Carnivore"] == "yes"
  	    carnivore = "Carnivore"
  	  else
        carnivore = "Non-carnivore" 
  	  end
      @@dinolog << { "NAME" => row["Genus"], "PERIOD" => row["Period"], 
                     "CONTINENT" => "N/A", "DIET" => carnivore,
    	             "WEIGHT_IN_LBS" => row["Weight"],
                     "WALKING" => row["Walking"], "DESCRIPTION" => "N/A" }
    end 
  end

  def bipeds
  	@search = @@dinolog.select { |dino| dino["WALKING"] == "Biped" }
  	self
  end

  def carnivores
  	#move logic
  	@search = @@dinolog.select { |dino| dino["DIET"] == "Carnivore" || dino["DIET"] == "Piscavore" || dino["DIET"] == "Insectivore"}
  	self
  end


  def period(given_period)
  	#add regex
  	@search = @@dinolog.select { |dino| dino["PERIOD"] == given_period }
  	self
  end

  def big_dinos
  	@search = @@dinolog.select { |dino| dino["WEIGHT_IN_LBS"].to_i > 4000 }
  	self
  end

  def small_dinos
  	@search = @@dinolog.select { |dino| dino["WEIGHT_IN_LBS"].to_i < 4000 }
  	self
  end

  def print_dino_info(dino_name)
  	puts @@dinolog.select { |dino| dino["NAME"] == dino_name }
  end

  def to_s
  	puts @search
  	@search = []
  end
end



d = Dinodex.new
d.read_dinosaur_csv("dinodex.csv")
d.read_african_dinosaur_csv("african_dinosaur_export.csv")
puts "Big Biped Carnivores"
d.find_bipeds.find_carnivores.find_big_dinos.to_s
puts "Small Bipeds"
d.find_small_dinos.find_bipeds.to_s
puts "Find Late Cretaceous Dinos"
d.find_period("Late Cretaceous").to_s
puts "Find Quetzalcoatlus"
d.print_dino_info("Quetzalcoatlus")


