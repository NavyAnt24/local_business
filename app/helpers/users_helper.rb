module UsersHelper

	def require_manager!
		if current_user.id == params[:id].to_i || current_user.staff_members.pluck(:id).include?(params[:id])
			# do your business
		else
			render :json => "Not sufficient permissions to edit"
		end
	end

	def allowed_to_view?
		if current_user.id == params[:id].to_i || current_user.manager_id == params[:id].to_i
			# allow to view
		elsif current_user.type == "Manager" && current_user.staff_members.pluck(:id).include?(params[:id]) 
			# allow to view
		else
			render :json => "Not allowed to view"
		end
	end


			def require_current_user!
		redirect_to new_session_url if current_user.nil?
	end
end
