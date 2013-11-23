module UsersHelper

    # Updates USER_TO_UPDATE using the values in params[:user]. Returns true if save is successful
    def update_user_attributes(user_to_update)
        User.admin_updateable_nonrelational_attributes.each do |attr|
        	attr_given = params[:user][attr]
            if attr_given.present?
                user_to_update.send("#{attr}=", attr_given)
            end
        end
        phoneNumber = params[:user][:phone_number]
        if phoneNumber != "+1"
        	phone_number_instance = PhoneNumber::newPhoneNumber(phoneNumber)
        	if !phone_number_instance
    			user_to_update.errors.add(:phone_number, "Invalid")
    			return false
    		else
    			result = user_to_update.save
    			if result
    				phone_number_instance.save
    				user_to_update.phone_number = phone_number_instance
    			end
    			return result
    		end
    	else
    		user_to_update.save
    	end
    end
end
