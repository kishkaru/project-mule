module ItemsHelper

	# Checks if ITEMS are being processed. Returns false if any of the ITEMS (menu items)
	# are currently being processed. Otherwise, lock them and return true.
    def verifyAndLockItems(items)
        # Check if qty is available and if menu item is being processed
        items.each do |menu_item|
            up_to_date_menu_item = MenuItem.find(menu_item.id)
            if up_to_date_menu_item.locked 
                return false
            end
        end

        # locks the menu items so they cannot be processed
        items.each do |menu_item|
            menu_item.update_attribute(:locked, true)
        end

        return true
    end

    # Unlocks ITEMS, where ITEMS is an array of menu items
    def unlockItems(items)
    	items.each do |item|
    		item.update_attribute(:locked, false)
    	end
    end

    # ITEMS is a hash of menu items mapped ot quantities. Returns true if 
    # there are enough menu items in stock and false if not
    def itemsInStock(items)
    	items.each do |menu_item, qty|
    		up_to_date_menu_item = MenuItem.find(menu_item.id)
    		if up_to_date_menu_item.quantity < qty.to_i
    			return false
    		end
    	end

    	return true
    end

    # ITEMS is a hash of menu items mapping to quantities. Subtracts
    # the quantities from the menu items in the database
    def updateMenuItemQuantities(items)
        items.each do |item, qty|
            menu_item = MenuItem.find(item.id)
            old_quantity = menu_item.quantity
            new_quantity = old_quantity - qty.to_i
            menu_item.update_attribute(:quantity, new_quantity)
        end
    end

end
