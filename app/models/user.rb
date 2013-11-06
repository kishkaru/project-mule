class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me
    attr_accessible :name, :role

    has_and_belongs_to_many :served_vendors, :class_name => "Vendor", :join_table => :servers_vendors, :foreign_key => :vendor_id
    has_one :served_area, :class_name => 'DeliveryArea'
    has_one :pickup_point, :class_name => 'DeliveryPoint'
    has_one :phone_number
end
