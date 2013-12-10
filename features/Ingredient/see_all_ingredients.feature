Feature: see all ingredients

	As an admin
	So that I know what Ingredents we have
	I want to see a list of all the Ingredients

Background: ingredients have been added to the database

	Given the following ingredients exist:
	| name | 
	| Tomato |
	| Cheese |
	| Avacado |

    And the admin account is set up
    And I am logged in with an admin account
	And I am on the all_ingredients page

Scenario: successfully see all ingredients
	Then I should see all the ingredients

