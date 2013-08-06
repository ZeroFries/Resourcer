class TopicsController < ApplicationController
	before_filter :collect_learning_paths

	def index
		@topics = Topic.all
		@topic_names = []
		@topics.each do |topic|
			@topic_names << topic.name
		end	
		# figure out how to order topics
	end

	def show
		@topic = Topic.find params[:id]
		@skills = @topic.skillz_hash
		# figure out how to order skills
	end

	def collect_learning_paths
		@learning_paths = LearningPath.all
	end
end
