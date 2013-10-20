Feature: create a new item to be stored in the database

	As an admin
	So that I can add Items to different Menus
	I want to store an Item in the database

Scenario: get form to create new item
	Given I am on the all_items page
	And I press "new_item"
	Then I should be on the create_new_item page

Scenario: successfully create a new item
	Given I am on the create_new_item page
	And I fill in the following information:
	| name | description | price | ingredients | vendor |
	| Wet_Burrito | super_juicy_and_wet | $4.50 | cheese, rice, beans | la_buritta |

	And I press "Create"
	Then I should be on the all_items page
	And I should see "Wet_Burrito"

Scenario: create a new item: empty
	Given I am on the create_new_item page
	And I fill in the following information:
	| name | description | price | ingredients | vendor |
	|	   |			 |		 |			   |		|

	And I press "Create"
	Then I should be on the create_new_item page
	And I should see "Error: empty fields!"
	And I should not be on the all_items page
