class Api::CompletedSourcesController < ApplicationController
	respond_to :json
	before_filter :force_login

	def create
		@user = current_user
		@completed = @user.completed_sources.create(source_id: params[:id]) unless @user.nil?
		#respond_with json: {success: true, html: (render_to_string 'learning_path/_learning_path')}
		#respond_with @completed, location: "api/completed_sources"
		render partial: 'learning_path/learning_path'
	end

	def destroy
		@completed = CompletedSources.find(params[:id]).first
		@completed.destroy
		respond_with @completed
	end
end
