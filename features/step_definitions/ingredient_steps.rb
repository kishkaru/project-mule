Given /the following ingredients exist/ do |ingredients_table|
    ingredients_table.hashes.each do |ingredient|
        Ingredient.create!(ingredient)
    end
end

Then /I should see all the ingredients/ do
    Ingredient.select("name").each do |t|
        page.should have_content(t.name)
    end
end
