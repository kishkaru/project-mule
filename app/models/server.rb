class Server < User
    has_and_belongs_to_many :vendors, :join_table => :servers_vendors
    has_one :delivery_area
end
