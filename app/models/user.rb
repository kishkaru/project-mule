class User < ActiveRecord::Base
    #Constants for user roles
    ADMIN = 1
    VENDOR = 2
    SERVER = 3
    CUSTOMER = 4

    ROLES_MAPPING = {1 => 'Admin', 2 => 'Vendor', 3 => 'Server', 4 => 'Customer'}

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me
    attr_accessible :first_name, :last_name, :phone_number
    attr_protected :role

    has_one :pickup_point, :class_name => 'DeliveryPoint'
    has_one :phone_number

    accepts_nested_attributes_for :phone_number

    def self.admin_updateable_nonrelational_attributes
        [:role,
            :password,
            :password_confirmation,
            :first_name,
            :last_name,
            :email]
    end

    def admin?
        role == User::ADMIN
    end
end
