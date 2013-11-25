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
    | name     | email             |
    | Chipotle | buro@chiptole.com |

  Given I am on the create_new_item page
	And I fill in "Name" with "Wet Burrito"
    And I select "Chipotle" from "item_vendor_id"
	And I fill in "Price" with "$4.50"
	And I fill in "Description" with "Super juicy and wet"
    And I fill in "Quantity" with "5"
	
	And I press "Create Item"
	Then I should see "Wet Burrito"


Scenario: successfully create a new Item with new Ingredients and Vendor
    Given I am on the create_new_item page

    And I press "Create Ingredient"

    Given the following phone numbers exist:
      | country | area |   number | extension |
      |       1 |  510 | 234-5678 |           |

    Given the following addresses exist:
      | line1             | line2     | city     | state |   zip |
      | 1234 Maple Street | Suite 110 | Berkeley | CA    | 94704 |

    Given I am on the create_new_vendor page
    And I fill in "Name" with "Chipotle"
    And I select "510-234-5678" from "vendor_phone_number_id"
    And I fill in "Email" with "bandito@chipotle.com"
    And I select "1234 Maple Street, Suite 110, Berkeley CA 94704" from "vendor_address_id"
    And I press "Create Vendor"
    Then I should be on the create_new_item page

    And I fill in "Name" with "Wet Burrito"
    And I select "Chipotle" from "item_vendor_id"
    And I fill in "Price" with "$4.50"
    And I fill in "Description" with "Super juicy and wet"
    And I select the following from "item_ingredient_ids":
      | name   |
      | Tomato |
    And I fill in "Quantity" with "5"

    And I press "Create Item"
    Then I should see "Wet Burrito"

Scenario: create a new item: empty
    Given I am on the create_new_item page
    And I press "Create Item"
    Then I should be on the create_new_item page
    And I should see "Error: empty fields!"
    And I should not be on the all_items page
