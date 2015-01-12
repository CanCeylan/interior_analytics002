class Log < ActiveRecord::Base

	def self.push

		resource = RestClient::Resource.new(
											"https://learning:learning@64.103.26.61/api/contextaware/v1/location/history/clients/00:00:2a:01:00:0f.json",
											:timeout => -1,
											:open_timeout => -1)
		response = resource.get  :params => {sortBy: "lastLocatedTime:desc"}# pageSize: 5000, page: 2}

		totalPages = JSON.parse(response)["Locations"]["totalPages"]
		currentPage = JSON.parse(response)["Locations"]["currentPage"]

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


	def self.potential
		return "osman"
	end

	def self.conversion
		return "osmancan" #Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id)) as conversion").where("location > 2").group("date(lastTime)")
	end

	def self.new_shoppers(params)
		return Log.select("DISTINCT(mac_id) as new_shoppers").where("location > 2 and date(firstTime) >= date(lastTime) and date(lastTime) = ?", params[:deyt].to_date)
	end

	def self.repeat_shoppers(params)
		return Log.select("DISTINCT(mac_id) as repeat_shoppers").where("location > 2 and date(firstTime) < date(lastTime) and date(lastTime) = ?", params[:deyt].to_date)
	end

end
