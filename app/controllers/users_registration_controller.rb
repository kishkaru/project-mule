class UsersRegistrationController < Devise::RegistrationsController
	include PhoneNumbersHelper

	before_filter :phone_number_format, :only => [:create, :update]

	def phone_number_format
		params[:user][:phone_number_attributes] = parsePhoneNumber(params[:user].delete(:phone_number))
  end

  def create
    super
    AdminMailer.new_registration(@user).deliver unless @user.invalid?
    UserMailer.welcome_email(@user).deliver unless @user.invalid?
  end

	protected

	def after_update_path_for(resource)
		account_path(resource)
	end
end