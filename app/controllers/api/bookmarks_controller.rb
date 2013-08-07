class Api::BookmarksController < ApplicationController
	respond_to :json
	before_filter :force_login

	def show
		@user = current_user
		@bookmark = Bookmark.where(user_id: @user.id).where(source_id: params[:id]).first
		if @bookmark.nil?
			respond_with json: {bookmarked: false}, location: "api/bookmarks"
		else
			respond_with json: {bookmarked: true}, location: "api/bookmarks"
		end
	end

	def create
		@user = current_user
		@bookmark = @user.bookmarks.create(source_id: params[:id]) unless @user.nil?
		respond_with @bookmark, location: "api/bookmarks"
	end
end
