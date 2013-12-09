@javascript
Feature: Add credit cards

	As a customer
	So that I can pay with different credit cards
	I want to add credit cards

	Background:
        Given slow for selenium
		Given a non admin account is set up
        And I am logged in with a user account

    Scenario: Go to add a new credit card
        Given I am on the edit credit cards page
    	Given I follow "Add new car"
    	Then I should be on the add new credit card page

    Scenario: Add a new card
    	Given I am on the add new credit card page
    	And I fill in "credit_card_card_number" with "4111-1111-1111-1111"
    	And I fill in "credit_card_exp_date" with "12/2020"
    	And I press "Add card"
    	Then I should be on the edit credit cards page
    	And I should see "ending in 1111"

    Scenario: Add new invalid card
    	Given I am on the add new credit card page
    	And I press "Add card"
    	Then I should see "Credit card number is required"
        And I should see "Expiration date is required"

    Scenario: Add a card that has already been added
        Given I am on the add new credit card page
        And I fill in "credit_card_card_number" with "4111-1111-1111-1111"
        And I fill in "credit_card_exp_date" with "12/2020"
        And I press "Add card"
        And I am on the add new credit card page
        And I fill in "credit_card_card_number" with "4111-1111-1111-1111"
        And I fill in "credit_card_exp_date" with "12/2020"
        And I press "Add card"
        Then I should be on the add new credit card page
        And I should see "Card already exists"
   
