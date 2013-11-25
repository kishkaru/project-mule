class Vendor < ActiveRecord::Base
    attr_accessible :email, :name, :address_attributes
    has_many :items
    has_and_belongs_to_many :servers, :class_name => "Server", :join_table => :servers_vendors, :association_foreign_key => "server_id"
    has_one :phone_number
    has_one :address, as: :addressable

    accepts_nested_attributes_for :address, :update_only => true
end
