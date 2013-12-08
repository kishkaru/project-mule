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
        user_attrs = params[:user]

        if user_signed_in?
            # Payment for signed in user
            user = User.find(current_user.id)
            if user.defaultCreditCard
                # Payment if current user has default credit card
                result = braintreeTransactionWithDefault(user, totals[:total])

                if result.success?
                    createOrder(user, items, result)

                    render :text => 'success'
                else
                    @credit_card_errors = result.errors
                    render :partial => 'cart/checkout-errors'
                end
            else
                # Payment if user has no default credit card. Provided credit card will become default
                createUserInVault(user)
                credit_card_store_result = createCreditCardInVault(credit_card_attrs, true, user)

                if !credit_card_store_result.success?
                    # return back errors if storage of credit card in vault failed
                    @credit_card_errors = credit_card_store_result.errors
                    render :partial => 'cart/checkout-errors'
                else
                    associateStoredCreditCard(credit_card_store_result.credit_card, user, true)

                    # Charge card if storage was successful
                    result = braintreeTransactionWithDefault(user, totals[:total])

                    if result.success?
                        createOrder(user, items, result)
                        render :text => 'success'
                    else
                        @credit_card_errors = result.errors
                        render :partial => 'cart/checkout-errors'
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

                    transaction_result = braintreeTransactionWithDefault(new_user, totals[:total])

                    if transaction_result.success?
                        createOrder(new_user, items, transaction_result)
                        render text: "success"
                    else
                        @credit_card_errors = transaction_result.errors
                        render :partial => 'cart/checkout-errors'
                    end
                else
                    @credit_card_errors = customer_and_card_store_result.errors
                    render :partial => 'cart/checkout-errors'
                end

            else
                # return errors of user account info
                @user_errors = new_user.errors
                render :partial => 'cart/checkout-errors'
            end

        end

    end

end
