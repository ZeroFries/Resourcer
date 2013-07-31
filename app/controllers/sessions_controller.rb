class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user.where(email: params[:email]).first
		@user.where(name: params[:email]).first if @user.nil? # log in by username or email
		if @user && @user.authenticate params[:password]
			session[:user_id] = @user.id
			redirect_to @user, notice: "Logged in"
		else
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
