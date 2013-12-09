class UsersRegistrationController < Devise::RegistrationsController
	include PhoneNumbersHelper

	before_filter :phone_number_format, :only => [:create, :update]

	def phone_number_format
		params[:user][:phone_number_attributes] = parsePhoneNumber(params[:user].delete(:phone_number))
	end
end