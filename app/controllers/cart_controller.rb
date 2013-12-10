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

        if !session[:customer_pickup_point].present?
            @pickup_point_error = "No pickup point chosen"
            render :partial => 'cart/checkout-errors' and return
        end

        items = cartItems
        totals = calculateTotals(9, items)
        credit_card_attrs = params[:credit_card]
        user_attrs = params[:modal_user]

        if totals[:total] == 0
            render :text => "empty cart" and return
        end

        if user_signed_in?
            # Payment for signed in user
            user = User.find(current_user.id)
            if user.defaultCreditCard
                # Payment if current user has default credit card
                while !verifyAndLockItems(items.keys)
                    sleep(1.0/2.0)
                end

                if itemsInStock(items)
                    result = braintreeTransactionWithDefault(user, totals[:total])
                else
                    unlockItems(items.keys)
                    @quantity_error = "Not enough items in stock. Please refresh for updated quantities"
                    render :partial => 'cart/checkout-errors'
                end

                if result.success?
                    updateMenuItemQuantities(items)
                    unlockItems(items.keys)
                    order = createOrder(user, items, result)
                    clearCart
                    sendConfirmationEmail(order)
                    render :text => order.id.to_s and return
                else
                    unlockItems(items.keys)
                    @credit_card_errors = result.errors
                    render :partial => 'cart/checkout-errors' and return
                end
            else
                # Payment if user has no default credit card. Provided credit card will become default
                createUserInVault(user)
                credit_card_store_result = createCreditCardInVault(credit_card_attrs, true, user)

                if !credit_card_store_result.success?
                    # return back errors if storage of credit card in vault failed
                    @credit_card_errors = credit_card_store_result.errors
                    render :partial => 'cart/checkout-errors' and return
                else
                    associateStoredCreditCard(credit_card_store_result.credit_card, user, true)

                    while !verifyAndLockItems(items.keys)
                        sleep(1.0/2.0)
                    end

                    if itemsInStock(items)
                        result = braintreeTransactionWithDefault(user, totals[:total])
                    else
                        unlockItems(items.keys)
                        @quantity_error = "Not enough items in stock. Please refresh for updated quantities"
                        render :partial => 'cart/checkout-errors'
                    end
                   

                    if result.success?
                        updateMenuItemQuantities(items)
                        unlockItems(items.keys)
                        order = createOrder(user, items, result)
                        clearCart
                        sendConfirmationEmail(order)
                        render :text => order.id.to_s and return
                    else
                        unlockItems(items.keys)
                        @credit_card_errors = result.errors
                        render :partial => 'cart/checkout-errors' and return
                    end

                end
            end
        else
            # Payment for new user

            # construct user_attrs with all user information for the model
            phone_number_attrs = parsePhoneNumber(user_attrs.delete(:phone_number))
            user_attrs[:phone_number_attributes] = phone_number_attrs

            new_user = User.new(user_attrs)

            if new_user.valid?

                customer_and_card_store_result = Braintree::Customer.create(
                    :first_name => new_user.first_name,
                    :last_name => new_user.last_name,
                    :credit_card => {
                        :number => credit_card_attrs[:card_number],
                        :expiration_date => credit_card_attrs[:exp_date],
                        :options => {
                            :make_default => true
                        }
                    }
                )

                if customer_and_card_store_result.success?
                    new_user.braintree_token = customer_and_card_store_result.customer.id
                    new_user.save!

                    associateStoredCreditCard(customer_and_card_store_result.customer.credit_cards[0], new_user, true)

                    while !verifyAndLockItems(items.keys)
                        sleep(1.0/2.0)
                    end

                    if itemsInStock(items)
                        transaction_result = braintreeTransactionWithDefault(new_user, totals[:total])
                    else
                        unlockItems(items.keys)
                        @quantity_error = "Not enough items in stock. Please refresh for updated quantities"
                        render :partial => 'cart/checkout-errors'
                    end

                    if transaction_result.success?
                        updateMenuItemQuantities(items)
                        unlockItems(items.keys)
                        order = createOrder(new_user, items, transaction_result)
                        clearCart
                        sendConfirmationEmail(order)
                        sign_in new_user
                        flash[:info] = 'You have been signed in with your new account!'
                        render text: order.id.to_s  and return
                    else
                        unlockItems(items.keys)
                        @credit_card_errors = transaction_result.errors
                        render :partial => 'cart/checkout-errors' and return
                    end
                else
                    @credit_card_errors = customer_and_card_store_result.errors
                    render :partial => 'cart/checkout-errors' and return
                end

            else
                # return errors of user account info
                @user_errors = new_user.errors
                render :partial => 'cart/checkout-errors' and return
            end

        end

    end

    private

    # empties card
    def clearCart
        session[:cart][:items].clear
    end

end
