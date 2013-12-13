class UsersController < ApplicationController
	before_filter :require_current_user!, :only => [:show]
	before_filter :require_no_current_user!, :only => [:create, :new]
	before_filter :require_manager!, :only => [:edit]

	def index
		@users = User.all
	end

	def show
		if params.include?(:id)
			@user = User.find(params[:id])
		else
			redirect_to user_url(current_user)
		end
	end

	def create
		@user = User.new(params[:user])
		@user.type = "StaffMember"

		if @user.save
			self.current_user = @user
			redirect_to user_url(@user)
		else
			render :json => @user.errors.full_messages
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user])
			redirect_to user_url(@user)
		else
			render :json => @user.errors.full_messages
		end
	end

end
