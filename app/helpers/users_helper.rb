module UsersHelper

	def require_manager!
		#redirect_to users_url

		if current_user.id == params[:id].to_i || current_user.staff_members.pluck(:id).include?(params[:id])
			# do your business
		else
			render :json => "Not sufficient permissions to edit"
		end
	end

	def is_my_manager?
		render :json => "Not allowed to see this info"
	end


			def require_current_user!
		redirect_to new_session_url if current_user.nil?
	end
end
