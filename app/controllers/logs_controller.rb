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
		render json: Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id)) as conversion").where("location > 2 and date(lastTime) between ? and ?", params[:start], params[:end]).group("date(lastTime)")
	end

	def overview
		#@conversion = Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id)) as conversion").where("location > 2 and date(lastTime) between ? and ?", params[:start], params[:end]).group("date(lastTime)")
		#@potential = Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id)) as potential").where("(location = 1 or location = 2) and date(lastTime) between ? and ?", params[:start], params[:end]).group("date(lastTime)")
		
		@storefront = Log.select("date(lastTime) as log_time, COUNT(DISTINCT(mac_id)) as potential, location").where("date(lastTime) between ? and ?", params[:start], params[:end]).group("date(lastTime), location")

		@storefront.each do |s|
			puts s.to_json
			s[]
		end

		result = { :storefront_potential => @potential, :storefront_conversion => @conversion.to_i/@potential.to_i}.to_json

		render json: result
	end

	def new_shoppers
		render json: Log.select("DISTINCT(mac_id) as new_shoppers").where("location > 2 and date(firstTime) >= date(lastTime) and date(lastTime) between ? and ?", params[:start], params[:end])
	end

	def repeat_shoppers
		render json: Log.select("DISTINCT(mac_id) as repeat_shoppers").where("location > 2 and date(firstTime) < date(lastTime) and date(lastTime) between ? and ?", params[:start], params[:end])
	end

end
