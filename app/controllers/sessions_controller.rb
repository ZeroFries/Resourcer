class SessionsController < ApplicationController
	def new
		if current_user
			redirect_to root_path
		else
			@user = User.new
			session[:return_to] ||= request.referer
		end
	end

	def create
		puts params
		@user = User.where(email: params[:user][:email]).first
		@user = User.where(name: params[:user][:email]).first if @user.nil? # log in by username or email
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			session[:return_to].nil? ? redirect_to(root_path) : redirect_to(session[:return_to])
			session[:return_to] = nil
		else
			flash.now[:error] = "Wrong login details"
			@user = User.new
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
