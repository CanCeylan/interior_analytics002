class Log < ActiveRecord::Base

	def self.push

		resource = RestClient::Resource.new(
											"https://learning:learning@64.103.26.61/api/contextaware/v1/location/history/clients/.json",
											:timeout => -1,
											:open_timeout => -1)
		response = resource.get # :params => {<params>}

		puts response
		visitor_list = JSON.parse(response)["Locations"]["entries"]
		#variables
		visitor_list.each do |v|
			Log.create({mac_id: v["macAddress"], 
						reason: v["historyLogReason"],
						hierarchy: v["MapInfo"]["mapHierarchyString"],
						mapX: v["MapCoordinate"]["x"],
						mapY: v["MapCoordinate"]["y"],
						firstTime: v["Statistics"]["firstLocatedTime"],
						lastTime: v["Statistics"]["lastLocatedTime"],
						serverTime: v["Statistics"]["currentServerTime"],
						location: Location.get_location(v["MapCoordinate"])
						})
		end
	end
end
