class Api::LearningPathsController < ApplicationController
	respond_to :json
	before_filter :force_login

	def index
		@learning_paths = LearningPath.all
		respond_with @learning_paths, location: "api/learning_paths"
	end
end
