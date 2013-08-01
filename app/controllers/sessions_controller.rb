class SessionsController < ApplicationController
	def new
		@user = User.new
		session[:return_to] ||= request.referer
	end

	def create
		@user.where(email: params[:email]).first
		@user.where(name: params[:email]).first if @user.nil? # log in by username or email
		if @user && @user.authenticate params[:password]
			session[:user_id] = @user.id
			session[:return_to].nil? ? redirect_to home_path : redirect_to session[:return_to]
			session[:return_to] = nil
		else
			flash.now[:error] = "Wrong login details"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
