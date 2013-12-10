module UsersHelper

    include PhoneNumbersHelper

    # Updates USER_TO_UPDATE using the values in params[:user]. Returns true if save is successful
    def update_user_attributes(user_to_update)
        phoneNumber = params[:user_options][:phone_number]
        if phoneNumber
            phone_number_hash = parsePhoneNumber(phoneNumber)
            user_to_update.assign_attributes({:phone_number_attributes => phone_number_hash})
        end
        User.admin_updateable_nonrelational_attributes.each do |attr|
            attr_given = params[:user][attr]
            if attr_given.present?
                user_to_update.send("#{attr}=", attr_given)
            end
        end
        user_to_update.role = params[:user_options][:role]
        if params[:user_options][:role] == "3"
            user_to_update.delivery_area = params[:server][:delivery_area_id].present? ? DeliveryArea.find(params[:server][:delivery_area_id]) : nil
        end
        user_to_update.save
    end


end
