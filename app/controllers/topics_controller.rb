class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
		@topic = Stream.find params[:id]
		@skills = @topic.skills
	end
end
