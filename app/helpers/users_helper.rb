module UsersHelper

    # Updates USER_TO_UPDATE using the values in params[:user]. Returns true if save is successful
    def update_user_attributes(user_to_update)
        User.admin_updateable_nonrelational_attributes.each do |attr|
            if params[:user][attr].present?
                user_to_update.send("#{attr}=", params[:user][attr])
            end
        end
        user_to_update.save
    end
end
