class Api::CompletedSourcesController < ApplicationController
	respond_to :json

	def create
		@user = current_user
		@completed = @user.completed_soures.create(source_id: params[:id]) unless @user.nil?
		respond_with @completed
	end

	def destroy
		@completed = CompletedSources.find(params[:id]).first
		@completed.destroy
		respond_with @completed
	end
end
