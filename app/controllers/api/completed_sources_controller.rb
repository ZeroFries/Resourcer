class Api::CompletedSourcesController < ApplicationController
	respond_to :json
	before_filter :force_login

	def show
		@user = current_user
		@completed = CompletedSource.where(user_id: @user.id).where(source_id: params[:id]).first
		if @completed.nil?
			respond_with json: {completed: false}, location: "api/completed_sources"
			#respond_with @completed, status: :not_found, location: "api/completed_sources"
		else
			respond_with json: {completed: true}, location: "api/completed_sources"
			#respond_with @completed, location: "api/completed_sources"
		end
	end

	def create
		@user = current_user
		@completed = @user.completed_sources.create(source_id: params[:id]) unless @user.nil?
		#respond_with json: {success: true, html: (render_to_string 'learning_path/_learning_path')}
		#respond_with @completed, location: "api/completed_sources"
		render partial: 'learning_path/learning_path'
	end

	def destroy
		@user = current_user
		CompletedSources.where(user_id: @user.id).where(source_id: params[:id]).destroy_all
		render partial: 'learning_path/learning_path'
	end
end
