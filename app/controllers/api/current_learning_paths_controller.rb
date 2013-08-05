class Api::CurrentLearningPathsController < ApplicationController
	respond_to :json
	before_filter :force_login

	def create
		@learning_path = LearningPath.find params[:id]
		current_user.current_learning_path.destroy if current_user.current_learning_path
		current_user.create_current_learning_path learning_path: @learning_path
		respond_with @learning_path
	end
end
