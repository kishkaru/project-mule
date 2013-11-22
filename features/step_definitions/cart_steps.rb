Given /^I have added (\d+) "(.*)" to my cart$/ do | qty, item_name |
	page.set_rack_session(:cart => {:items => {Item.find_by_name(item_name) => qty}})
end