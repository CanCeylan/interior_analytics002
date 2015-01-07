class LogsController < ApplicationController

	def push_data
		render json: Log.push
	end

	def potential
		render json: Log.potential #json: Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id))").where("location = 1 or location = 2").group("date(lastTime)")
	end

	def conversion
		render json: Log.conversion
		#render json: Log.select("date(lastTime) as log_time, COUNT(mac_id)").group("date(lastTime)")
	end

	def new_shoppers
		render json: Log.new_shoppers(params)
	end

	def repeat_shoppers
		render json: Log.repeat_shoppers(params)
	end

end
