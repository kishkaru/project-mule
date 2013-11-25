Given /the following DeliveryAreas exist/ do |areas_table|
  areas_table.hashes.each do |area|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    DeliveryArea.create!(area)  
    end
end


Given /the following Delivery Points exist/ do |points_table|
  points_table.hashes.each do |point|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    address = point.delete("address")
    pattern = /(.*), (.*), (.*), (.*)/
    match = pattern.match(address)
    address_attr = {:line1 => match[1],
      :city => match[2],
      :state => match[3],
      :zip => match[4]}
    point[:address_attributes] = address_attr
    DeliveryPoint.create!(point)  
    end
end


When /I follow "([^"]*)" for "([^"]*)"$/ do |action, point|
  DeliveryPoint.all.each do |table|
	if point == table.address
	  table.destroy
	else
	  puts "Not a valid request: does not exist"
        end
  end
end
