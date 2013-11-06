module UsersHelper

  # Updates USER_TO_UPDATE using the values in params[:user]. Returns true if save is successful
  def update_user_attributes(user_to_update)
    admin_updateable_attributes.each do |attr|
      if params[:user][attr].present?
        user_to_update.send("#{attr}=", params[:user][attr])
      end
    end
    user_to_update.save
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
