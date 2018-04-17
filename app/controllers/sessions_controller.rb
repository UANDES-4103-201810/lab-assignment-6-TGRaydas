class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		@user = User.where(email: params[:session][:email], password: params[:session][:password]).first
		if @user == nil
			redirect_to root_url, flash.now[:error] => "Error in validation credentials please Sign Up if you don't have an account"
		end
		if @user != nil
			session[:current_user_id] = @user.id
			redirect_to "/user" + @user.id.to_s, error: "You have successfully logged in."
			end
	end

	def destroy
		#complete this method
		session[:current_user_id] = nil
		flash[:notice] = "You have successfully logged out."
		redirect_to root_url
	end
end
