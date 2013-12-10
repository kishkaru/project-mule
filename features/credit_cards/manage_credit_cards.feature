@javascript
Feature: Manage credit cards

	As a customer
	So that I can pay with different credit cards
	I want to manage credit cards

	Background:
		Given a non admin account is set up
        And I am logged in with a user account
        And I am on the edit credit cards page

    Scenario: Go to add a new credit card
        And I am on the edit credit cards page
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

    Scenario: Delete credit card
    	Given I am on the add new credit card page
    	And I fill in "credit_card_card_number" with "4111-1111-1111-1111"
    	And I fill in "credit_card_exp_date" with "12/2020"
    	And I press "Add card"
    	And I follow "Delete" and confirm
    	Then I should be on the edit credit cards page
    	And I should see "No cards added"

    Scenario: Change default card
    	Given a user is logged in and has the following credit cards set up:
    	| number | exp_date |
    	| 4111111111111111 | 12/2020 |
    	| 4005519200000004 | 12/2020 |
    	And I follow "Make default" and confirm
    	Then I should be on the edit credit cards page
    	And the card ending in "0004" should be the default card