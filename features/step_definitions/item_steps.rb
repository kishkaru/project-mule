Given /the following items exist/ do |items_table|
  items_table.hashes.each do |item|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Item.create!(item)  
    end
end

Then /I should see all the items/ do
 Item.select("name").each{ |t|
   page.should have_content(t.name)
 }
end
