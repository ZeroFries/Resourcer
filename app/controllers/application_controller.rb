class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find session[:user_id] unless session[:user_id].nil?
  end

  def force_login
  	redirect_to "/login" if current_user.nil?
  end

  def admin_only
    if current_user.nil?
      redirect_to "/"
    else
      redirect_to "/" unless current_user.admin?
    end
  end

  def setup_bookmarks_hash
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

  helper_method :current_user, :force_login, :admin_only, :setup_bookmarks_hash
end
