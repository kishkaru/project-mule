Given /the following delivery areas exist/ do |delivery_areas_table|
    delivery_areas_table.hashes.each do |item|
        #vendor = item.delete("vendor")
        DeliveryArea.create!(item)
    end
end

Then /^I should view "([^"]*)"$/ do |select_area|
 pending
end

Given /^I am on the delivery points page for "([^"]*)"$/ do |select_area|
 pending 
end
