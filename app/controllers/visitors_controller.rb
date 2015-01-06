class VisitorsController < ApplicationController

	def update_db
		render json: Visitor.response
	end

	def visitor_list
		response = RestClient.get 'https://learning:learning@64.103.26.61/api/contextaware/v1/location/clients', {params: {pageSize: 2}, accept: :json}
		puts JSON.parse(response)["Locations"]
		visitor_list = JSON.parse(response)["Locations"]["entries"]
		
		render json: visitor_list
	end

end
