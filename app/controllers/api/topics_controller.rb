class Api::TopicsController < ApplicationController
	respond_to :json

	def show
		@topic = Source.find params[:id]
		respond_with @topic
	end
end
