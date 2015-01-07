class LogsController < ApplicationController

	def push_data
		render json: Log.push
	end


	def storefront_potential
		render json: Log.select("date(lastTime) AS log_time, COUNT(DISTINCT(mac_id)) AS potentials").group("date(lastTime)")
	end
end
