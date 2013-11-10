Given /the following items exist/ do |items_table|
  items_table.hashes.each do |item|
    Item.create!(item)  
    end
end

Then /I should see all the items/ do
 Item.select("name").each do |t|
   page.should have_content(t.name)
 end
end
