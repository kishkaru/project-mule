@javascript
Feature: Delete credit cards

	As a customer
	So that I can remove cards I don't want to use
	I want to delete my stored credit cards

	Background:
		Given a user is logged in and has the following credit cards set up:
        | number           | exp_date |
        | 4111111111111111 | 12/2020  |
        | 4005519200000004 | 12/2020  |

        And I am on the edit credit cards page

    Scenario: Delete no default credit card
    	Given I follow "delete-0004" and confirm
    	Then I should be on the edit credit cards page
    	And I should see "Credit card ending in 0004 deleted successfully"

    Scenario: Delete a default credit card
    	Given I follow "delete-1111" and confirm
    	Then I should be on the edit credit cards page
    	And I should see "Credit card ending in 1111 deleted successfully"
    	And the card ending in "0004" should be the default card