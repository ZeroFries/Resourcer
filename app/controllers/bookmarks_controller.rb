class BookmarksController < ApplicationController
	before_filter :force_login

	def index
		@bookmarks = current_user.bookmarks
		@completed_sources = current_user.completed_sources.map { |c| c.source }
		hash = {}
		@bookmarks.each do |bookmark|
			source = bookmark.source
			topic = source.topics.first
			# access bookmarks by topic name and completion status
			if @completed_sources.include? source
				hash[topic.name] = {} if hash[topic.name].nil?
				hash[topic.name][:completed] = [] if hash[topic.name][:completed].nil?
				hash[topic.name][:completed] << source
			else
				hash[topic.name] = {} if hash[topic.name].nil?
				hash[topic.name][:uncompleted] = [] if hash[topic.name][:uncompleted].nil?
				hash[topic.name][:uncompleted] << source
			end
		end
		@bookmarks = hash
	end

	def destroy
		@bookmark = Bookmark.find params[:id]
		@bookmark.destroy
		redirect_to bookmarks_path
	end
end
