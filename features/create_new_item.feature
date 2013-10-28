Feature: create a new item to be stored in the database

	As an admin
	So that I can add Items to different Menus
	I want to store an Item in the database

Scenario: get form to create new item
	Given I am on the all_items page
	And I follow "New Item"
	Then I should be on the create_new_item page

Scenario: successfully create a new item
	Given I am on the create_new_item page
	And I fill in "Name" with "Wet Burrito"
	And I fill in "Price" with "$4.50"
	And I fill in "Description" with "Super juicy and wet"
	And I fill in "Quantity" with "5"
	
	And I press "Create Item"
	
	Then I should see "Wet Burrito"
	
Scenario: create a new item: empty
    Given I am on the create_new_item page
    And I press "Create Item"
    Then I should be on the create_new_item page
    And I should see "Error: empty fields!"
    And I should not be on the all_items page
