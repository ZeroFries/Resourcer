class BookmarksController < ApplicationController
	before_filter :force_login

	def index
		setup_bookmarks_hash
	end

	def destroy
		@bookmark = Bookmark.find params[:id]
		@bookmark.destroy
		redirect_to bookmarks_path
	end
end
