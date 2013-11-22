class CartController < ApplicationController
	def cart
		@subtotal = 0
		@tax_total = 0
		@total = 0
		@items = {}
    	@tax = 9.0
  		if session[:cart] && session[:cart][:items]
    		session[:cart][:items].each do |id, qty|
      			@items[Item.find(id)] = qty
      		end
      	end
      	puts "##^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      	puts @items
      	puts session[:cart]
      	@items.each do |item_obj,qty|
        	@subtotal = @subtotal + item_obj.price * qty
        end
        @tax_total = @tax / 100.0 * @subtotal
        @total = @tax_total + @subtotal
    	render :partial => 'cart/cart-modal-body'
    end
end