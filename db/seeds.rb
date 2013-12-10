admin = User.create!(:email => "admin@admin.com", :password => "iambatman", :password_confirmation => "iambatman", :phone_number_attributes => {:area => "123", :number => "123-4567", :country => "1"}, :first_name => "Mule", :last_name => "Admin")
admin.update_attribute(:role, User::ADMIN)

vendor_1 = Vendor.create!(:name => 'Tivoli Caffe', :address_attributes =>  {:line1 => '2554 Bancroft Way', :city => 'Berkeley', :state => 'CA', :zip => 94704}, :email => 'tivoli@tivoli.com')

item_1 = Item.create!(:name => 'Sausage Pizza', :price => 7.99, :description => 'Yummy Yummy Italio!', :vendor_id => vendor_1.id)
item_1.create_menu_item()

server_1 = Server.create!(:email => 'dan@lb.com', :password => 'dantheman', :password_confirmation => 'dantheman', :phone_number_attributes => {:area => "123", :number => "213-4576", :country => "1"}, :first_name => 'Daniel', :last_name => 'Daniel')
server_1.update_attribute(:role, User::SERVER)

delivery_area_1 = DeliveryArea.create!(:name => 'Downtown Berkeley')
delivery_area_1.delivery_points.create!(:address_attributes => {:line1 => '2616 Telegraph Avenue', :city => 'Berkeley', :state => 'CA', :zip => 94704})
delivery_area_1.delivery_points.create!(:address_attributes => {:line1 => '2442 Piedmont Avenue', :city => 'Berkeley', :state => 'CA', :zip => 94704})
delivery_area_1.delivery_points.create!(:address_attributes => {:line1 => '1909 Dwight Way', :city => 'Berkeley', :state => 'CA', :zip => 94704})

server_1.update_attribute(:delivery_area, delivery_area_1)