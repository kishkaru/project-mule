module UsersHelper

	# Updates USER_TO_UPDATE using the values in params[:user]. Returns true if successful
	def update_user_attributes(user_to_update)
		admin_updateable_attributes.each do |attr|
			if params[:user][attr]
				if !user_to_update.update_attribute(attr, params[:user][attr]) 
					return false
				end
			end
		end
		return true
	end

	# All the user attributes to update from admin edit page
	def admin_updateable_attributes
		[:role,
			:user_name,
			:password,
			:password_confirmation,
			:first_name,
			:last_name,
			:email]
	end
end
