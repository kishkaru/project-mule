Given /the following items exist/ do |items_table|
    items_table.hashes.each do |item|
        vendor = item.delete("vendor")
        Item.create!(item)
    end
end

Then /I should see all the items/ do
    Item.select("name").each do |t|
        page.should have_content(t.name)
    end
end

Given /I select the following from "(.*?)"/ do |all_ingredients_list, ingredients_table|
    ingredients_table.hashes.each do |ingredient|
        select(ingredient['name'], :from => all_ingredients_list)
    end
end
