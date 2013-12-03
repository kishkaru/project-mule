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
    	end
    end
  	@cart_items.each do |item_obj,qty|
    	@subtotal = @subtotal + item_obj.price * qty
    end
    @tax_total = @tax / 100.0 * @subtotal
    @total = @tax_total + @subtotal
    if @cart_items.present?
  	  render :partial => 'cart/cart-modal-body'
    else
      render :partial => 'cart/empty-cart'
    end
  end

  def pay
    result = Braintree::Transaction.sale(
      :amount => "1.00",
      :credit_card => {
        :number => "5105105105105100",
        :expiration_date => "05/14"
        }
    )
    if result.success?
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! success!: #{result.transaction.id}"
    elsif result.transaction
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
    else
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      p result.errors
    end
  end
end