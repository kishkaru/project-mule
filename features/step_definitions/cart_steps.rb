Given /I have added the following items to my cart/ do | table |
	cart = {:items => {}}
	table.hashes.each do |item|
		cart[:items][Item.find_by_name(item[:name])] = item[:qty]
	end
	page.set_rack_session(:cart => cart)
end