class UsersController < ApplicationController
	def new
		@user = User.new
		session[:return_to] ||= request.referer
	end

	def create
		@user = User.new user_params
		if @user.save
			session[:return_to].nil? ? path = root_path : path = session[:return_to]
			redirect_to path, notice: "Account created!"
			session[:return_to] = nil
		else
			render :new
		end
	end

	private

		def user_params
			params.require(:user).permit :name, :email, :password, :password_confirmation
		end
end
