module CartHelper

	# Puts all items from the session[:cart] into a hash
    # where the key is the item object and value is the quantity
    def cartItems
        items = {}
        if session[:cart] && session[:cart][:items]
            session[:cart][:items].each do |id, qty|
                items[MenuItem.find(id)] = qty
            end
        end

        return items
    end

    # Returns a hash of calculated subtotal, tax_total, and total
    # using TAX and ITEMS hash returned by cartItems
    def calculateTotals(tax, items)
        result = {:subtotal => 0}
        items.each do |item_obj,qty|
            result[:subtotal] += item_obj.price * qty
        end
        result[:tax_total] = tax / 100.0 * result[:subtotal]
        result[:total] = result[:tax_total] + result[:subtotal]

        return result
    end

    # Returns if there are expired items in the cart
    def expiredItemsInCart
        session[:cart][:items].keys.each do |menu_item_id|
            if MenuItem.find(menu_item_id).expiration_time <= Time.now
                return true
            end
        end

        return false
    end
    
end