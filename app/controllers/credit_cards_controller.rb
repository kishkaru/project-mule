class CreditCardsController < ApplicationController
	include CreditCardsHelper

	before_filter :user_logged_in

	def index
		@editing = true
	end

	def new
	end

	def create
		user = User.find(current_user.id)

		createUserInVault(user)

		# Check if this is the first credit card to decide if it should be set as default
		default = false
		if user.credit_cards.length == 0
			default = true
		end

		credit_card_to_add = params[:credit_card]

		credit_card_result = createCreditCardInVault(credit_card_to_add, default, user)

		if credit_card_result.success?
			if alreadyInVault(credit_card_result.credit_card.unique_number_identifier, user.braintree_token)
				if Braintree::CreditCard.delete(credit_card_result.credit_card.token)
					flash[:error] = 'Card already exists'
					render 'new' and return
				else
					flash[:error] = "Error: Credit card ending in #{cc.last_four} was not deleted"
				end
			else
				associateStoredCreditCard(credit_card_result.credit_card, user, default)

				flash[:success] = 'Credit card was added successfully'
			end

			redirect_to edit_credit_cards_path
		else
			@cc_errors = credit_card_result.errors
			render 'new'
		end

	end

	def destroy
		cc = CreditCard.find(params[:id])
		user = User.find(current_user.id)

		if Braintree::CreditCard.delete(cc.token)
			user.credit_cards.delete(cc)
			cc.destroy

			flash[:success] = "Credit card ending in #{cc.last_four} deleted successfully"

			# Set new default card if default was deleted
			user_credit_cards = user.credit_cards
			if user_credit_cards.present? && !user.defaultCreditCard
				new_default = user_credit_cards.first
				setDefaultCC(user, new_default)
			end

			redirect_to edit_credit_cards_path
		else
			flash[:error] = "Error: Credit card ending in #{cc.last_four} was not deleted"
			render 'index'
		end
	end

	# Sets the credit card with id params[:id] to the current users default credit card
	def setDefault
		setDefaultCC(User.find(current_user.id), CreditCard.find(params[:cc_id]))

		redirect_to edit_credit_cards_path
	end

	def creditCardSelection
        render :partial => 'credit_cards/credit-card-selection-form'
    end

    def changeCreditCard
        cc_chosen = CreditCard.find(params[:credit_card_chosen])
        setDefaultCC(current_user, cc_chosen)

        render :text => current_user.defaultCreditCard.last_four
    end

    def useNewCreditCard
    	user = User.find(current_user.id)
    	credit_card_store_result = createCreditCardInVault(params[:credit_card], false, user)

        if !credit_card_store_result.success?
            # return back errors if storage of credit card in vault failed
            @credit_card_errors = credit_card_store_result.errors
            render :partial => 'cart/checkout-errors'
        else
        	if alreadyInVault(credit_card_store_result.credit_card.unique_number_identifier, user.braintree_token)
        		delete_result = Braintree::CreditCard.delete(credit_card_store_result.credit_card.token)
				if delete_result
					@duplicate_error = 'Card already exists'
					render :partial => 'cart/checkout-errors'
				else
					@credit_card_errors = credit_card_store_result.errors
					render :partial => 'cart/checkout-errors'
				end
			else
	            new_cc = associateStoredCreditCard(credit_card_store_result.credit_card, user, false)
	            setDefaultCC(user, new_cc)
	            render :text => user.defaultCreditCard.last_four
	        end
        end
    end

end