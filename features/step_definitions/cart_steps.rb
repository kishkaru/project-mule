Given /I have added the following items to my cart/ do | table |
	cart = {:items => {}}
	table.hashes.each do |item|
		cart[:items][Item.where(:name => item[:name]).order("created_at").last.id] = item[:qty].to_i
	end
	page.set_rack_session(:cart => cart)
end