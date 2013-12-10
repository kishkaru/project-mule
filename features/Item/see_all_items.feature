Feature: see all items

	As an admin
	So that I know what food Items we offer
	I want to see a list of all the Items

Background: items have been added to the database

	Given the following items exist:
    | name                | vendor   | price | description  |
    | Regular_Burrito     | Chipotle | $2.50 | the usual    |
    | Spicy_Burrito       | Chipotle | $3.50 | on fire      |
    | Carne_Asada_Burrito | Chipotle | $5.50 | roasted beef |

    And the admin account is set up
    And I am logged in with an admin account
	And I am on the all_items page

Scenario: successfully see all items
	Then I should see all the items

