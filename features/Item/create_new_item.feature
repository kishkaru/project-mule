Feature: create a new item to be stored in the database

	As an admin
	So that I can add Items to different Menus
	I want to store an Item in the database

Scenario: get form to create new item
	Given I am on the all_items page
	And I follow "New Item"
	Then I should be on the create_new_item page

Scenario: successfully create a new item from existing ingredients and vendor
  Given the following ingredients exist:
    | name    |
    | Tomato  |
    | Cheese  |
    | Avacado |

  Given the following vendors exist:
    | name     | email             | address |
    | Chipotle | buro@chiptole.com | 1, 1, CA, 1  |

  Given I am on the create_new_item page
	And I fill in "Name" with "Wet Burrito"
    And I select "Chipotle" from "item_vendor_id"
	And I fill in "Price" with "$4.50"
	And I fill in "Description" with "Super juicy and wet"

	And I press "Create Item"
	Then I should see "Wet Burrito"


Scenario: successfully create a new Item with new Ingredients and Vendor
    

Scenario: create a new item: empty
    Given I am on the create_new_item page
    And I press "Create Item"
    Then I should be on the create_new_item page
    And I should see "Error: empty fields!"
    And I should not be on the all_items page
