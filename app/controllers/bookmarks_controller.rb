class BookmarksController < ApplicationController
	before_filter :force_login

	def index
		@bookmarks = current_user.bookmarks
		# sort in some way
	end

	def destroy
	end
end
