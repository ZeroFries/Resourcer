class SourcesController < ApplicationController
	def index
		@sources = Source.all
	end

	def show
		@source = Source.find params[:id]
		@topics = @source.topics
	end
end
