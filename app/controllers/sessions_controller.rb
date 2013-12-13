class SessionsController < ApplicationController
	before_filter :require_no_current_user!, :only => [:create, :new]
	before_filter :require_current_user!, :only => [:destroy]

	def create
		user = User.find_by_email(params[:user][:email])

		if user.nil?
			render :json => "Credentials were wrong"
		else
			self.current_user = user
			redirect_to users_url
		end
	end

	def destroy
		logout_current_user!
		redirect_to new_session_url
	end

	def new
	end
end