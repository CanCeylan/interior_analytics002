class Visitor < ActiveRecord::Base
	has_many :visits
	has_many :locations, through: :visits

	def self.response
		response = RestClient.get 'https://learning:learning@64.103.26.61/api/contextaware/v1/location/clients', {params: {floor: "Main Floor"}, accept: :json}
		puts response
		visitor_list = JSON.parse(response)["Locations"]["entries"]
		parser(visitor_list) 
		check_present(visitor_list)
	end

	def self.parser(visitor_list)
		visitor_list.each do |v|
			visitor = Visitor.find_or_create_by({mac_id: v["macAddress"], at_location: 0})
			#firstLocatedTime her bir mac_id icin tekse, buraya onu da eklemeliyiz.
			location_id = Location.get_location(v["MapCoordinate"])
			start_time = v["Statistics"]["lastLocatedTime"]
			if visitor.at_location == 0 && location_id != 0 #first time visitor
				Visit.create({visitor_id: visitor.id, location_id: location_id, start_time: start_time})
				visitor.update({at_location: location_id})
			elsif visitor.at_location != location_id && location_id != 0 #moves from one location to another
				visitor.visits.last.update({end_time: start_time})
				Visit.create({visitor_id: visitor.id, location_id: location_id, start_time: start_time})
				visitor.update({at_location: location_id})
			elsif visitor.at_location != location_id && location_id == 0 #visit ends
				visitor.visits.last.update({end_time: start_time})
				visitor.update({at_location: location_id})
			end
		end
	end

	def self.check_present(visitor_list)
		current_visitors = Visitor.where.not(at_location:0)
		current_visitors.each do |v|
			if !is_present(v, visitor_list)
				v.visits.last.update({end_time: visitor_list.first["currentServerTime"]})
			end
		end
	end

	def self.is_present(visitor, visitor_list)
		visitor_list.each do |v|
			if v["macAddress"] == visitor.mac_id
				return true
			end
		end
		false
	end

end





