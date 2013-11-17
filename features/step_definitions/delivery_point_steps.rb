Given /the following delivyer_points exist/ do |items_table|
    items_table.hashes.each do |item|
        delivery_area = item.delete("delivery_area")
        DeliveryPoint.create!(item)
    end
end

