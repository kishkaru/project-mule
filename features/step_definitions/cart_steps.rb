Given /I have added the following items to my cart/ do | table |
	cart = {:items => {}}
	table.hashes.each do |item|
		cart[:items][Item.where(:name => item[:name]).order("created_at").last.id] = item[:qty].to_i
	end
	page.set_rack_session(:cart => cart)
end

Given /I increase the quantity of "(.*)"/ do | item |
	id = Item.where(:name => item).order("created_at").last.id
	button_id = "#{id}-item-plus"
	find_button(button_id).click
end

Given /I decrease the quantity of "(.*)"/ do | item |
	id = Item.where(:name => item).order("created_at").last.id
	button_id = "#{id}-item-minus"
	click_button(button_id)
end