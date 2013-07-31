class Api::SourcesController < ApplicationController
	respond_to :json

	def show
		@source = Source.find params[:id]
		respond_with @source
	end
end