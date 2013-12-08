class CartController < ApplicationController
    include PhoneNumbersHelper
    include CreditCardsHelper
    include CheckoutHelper
    include CartHelper

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
        credit_card_attrs = params[:credit_card]

        # Payment for signed in user
        if user_signed_in?
            user = User.find(current_user.id)
            if user.defaultCreditCard
                # Payment if current user has default credit card
                result = braintreeTransactionWithDefault(user, totals[:total])

                if result.success?
                    createOrder(user, items, result)

                    render :text => 'success'
                else
                    @cc_errors = result.errors
                    render :partial => 'credit_cards/credit-card-errors'
                end
            else
                # Payment if user has no default credit card. Provided credit card will become default
                createUserInVault(user)
                credit_card_store_result = createCreditCardInVault(credit_card_attrs, true, user)

                if !credit_card_store_result.success?
                    # return back errors if storage of credit card in vault failed
                    @cc_errors = credit_card_store_result.errors
                    render :partial => 'credit_cards/credit-card-errors'
                else
                    # Associate card with user
                    cc_to_add = CreditCard.create!(:token => credit_card_store_result.credit_card.token,
                        :last_four => credit_card_store_result.credit_card.last_4,
                        :default => true)
                    user.credit_cards << cc_to_add

                    # Charge card if storage was successful
                    result = braintreeTransactionWithDefault(user, totals[:total])

                    if result.success?
                        createOrder(user, items, result)

                        render :text => 'success'
                    else
                        @cc_errors = result.errors
                        render :partial => 'credit_cards/credit-card-errors'
                    end

                end
            end
        end

        

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

end
