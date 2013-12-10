Given /the following orders exist/ do |orders_table|
    orders_table.hashes.each do |order|
	user_id = order.delete("user_id")
        o = Order.create!(order)
	o.update_attribute(:user_id, user_id.to_i)
	o.save!
    end
end

