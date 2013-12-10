#module for helping controller specs
module ValidUserHelper
    def signed_in_as_admin
        admin = User.create!({
                :email => "admin@admin.com",
                :password => "iambatman",
                :password_confirmation => "iambatman",
                :phone_number_attributes => {
                    :area => "123",
                    :number => "123-4567",
                    :country => "1"},
                :first_name => "Mule",
                :last_name => "Admin"})
        admin.update_attribute(:role, User::ADMIN)
        login_as(admin, :scope => :user,
            :run_callbacks => false)
    end
end

# module for helping request specs
module ValidUserRequestHelper

    # for use in request specs
    def sign_in_as_admin
        admin = User.create!({
                :email => "admin@admin.com",
                :password => "iambatman",
                :password_confirmation => "iambatman",
                :phone_number_attributes => {
                    :area => "123",
                    :number => "123-4567",
                    :country => "1"},
                :first_name => "Mule",
                :last_name => "Admin"})
        admin.update_attribute(:role, User::ADMIN)
        post_via_redirect user_session_path, 'user[email]' => admin.email, 'user[password]' => admin.password
    end
end

RSpec.configure do |config|
    config.include ValidUserHelper, :type => :controller
    config.include ValidUserRequestHelper, :type => :request
end
