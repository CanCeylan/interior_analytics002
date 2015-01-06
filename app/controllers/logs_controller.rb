class LogsController < ApplicationController

	def push_data
		render json: Log.push
	end
end
