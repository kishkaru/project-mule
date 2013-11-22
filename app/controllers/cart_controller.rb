class CartController < ApplicationController
	def cart
		@subtotal = 0
		@tax_total = 0
		@total = 0
		@cart_items = {}
  	@tax = 9.0
		if session[:cart] && session[:cart][:items]
  		session[:cart][:items].each do |id, qty|
    			@cart_items[Item.find(id)] = qty
          puts Item.find(id).price
    	end
    end
  	puts @cart_items
  	@cart_items.each do |item_obj,qty|
    	@subtotal = @subtotal + item_obj.price * qty
    end
    @tax_total = @tax / 100.0 * @subtotal
    @total = @tax_total + @subtotal
  	render :partial => 'cart/cart-modal-body'
  end
end