class LogsController < ApplicationController

	respond_to :json
	#ActiveRecord::Base.include_root_in_json = true
	
	def push_data
		render json: Log.push
	end

	def potential
		render json: Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id)) as potential").where("(location = 1 or location = 2) and date(lastTime) between ? and ?", params[:start], params[:end]).group("date(lastTime)")
	end

	def conversion
		@convs =  Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id)) as conversion").where("location > 2").group("date(lastTime)")

		render json: @convs
	end

	def new_shoppers
		render json: Log.new_shoppers(params)
	end

	def repeat_shoppers
		render json: Log.repeat_shoppers(params)
	end

end
