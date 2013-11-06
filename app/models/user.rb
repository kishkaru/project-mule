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
    attr_accessible :first_name, :last_name
    attr_protected :role, :user_name

    has_and_belongs_to_many :served_vendors, :class_name => "Vendor", :join_table => :servers_vendors, :foreign_key => :vendor_id
    has_one :served_area, :class_name => 'DeliveryArea'
    has_one :pickup_point, :class_name => 'DeliveryPoint'
    has_one :phone_number
end
