class CartController < ApplicationController
    include PhoneNumbersHelper

    def cart
        @subtotal = 0
        @tax_total = 0
        @total = 0
        @tax = 9.0
        @cart_items = cartItems
        totals = calculateTotals(@tax, @cart_items)
        @subtotal = totals[:subtotal]
        @tax_total = totals[:tax_total]
        @total = totals[:total]
        render :partial => 'cart/cart-modal-body'
    end

    def pay

        items = cartItems
        totals = calculateTotals(9, items)

        result = Braintree::Transaction.sale(
          :payment_method_token => current_user.defaultCreditCard.token,
          :amount => totals[:total].round(2).to_s,
          :credit_card => {:cvv => "100"}
        )

        if result.success?
            puts "!!!!!!! win"
            new_order = Order.create_with_items(items)
            new_order.user = current_user
            new_order.transaction_id = result.transaction.id
            new_order.save!
        else
            puts "#{[result.errors]}"
        end

        render :text => 'success'

=begin
        credit_card_attrs = params[:credit_card]
        user_attrs = params[:user]

        # construct user_attrs with all user information for the model
        phone_number_attrs = parsePhoneNumber(user_attrs.delete(:phone_number))
        user_attrs[:phone_number_attributes] = phone_number_attrs

        new_user = User.new(user_attrs)

        if new_user.valid?
            render text: "success"
        else
        end

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
=end
    end

    private

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

end
