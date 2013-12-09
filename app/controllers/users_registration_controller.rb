class UsersRegistrationController < Devise::RegistrationsController
	include PhoneNumbersHelper

	before_filter :phone_number_format, :only => [:create, :update]

	def phone_number_format
		params[:user][:phone_number_attributes] = parsePhoneNumber(params[:user].delete(:phone_number))
		puts "@@@@@@"
		puts params
	end

	protected

	def after_update_path_for(resource)
		account_path(resource)
	end
end