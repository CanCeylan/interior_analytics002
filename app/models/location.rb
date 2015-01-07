class Location < ActiveRecord::Base
	has_many :visits
	has_many :visitors, through: :visits

	serialize :bounds, Hash

	def self.get_location(coordinates)
		puts ">>>>> ISTE GELDIM BURDAYIM"
		puts coordinates.to_s
		puts "  -   -    -   -  "
		Location.all.each do |zone|
			if zone.bounds["minX"].to_i <= coordinates["x"] &&
			   coordinates["x"] <= zone.bounds["maxX"].to_i &&
			   zone.bounds["minY"].to_i <= coordinates["y"] &&
			   coordinates["y"] <= zone.bounds["maxY"].to_i
				return zone.id
			end	
		end
		0
	end
end
