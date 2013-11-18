Feature: create a new address to be stored in the database

  As an admin
  So that I can associate addresses with vendors and users
  I want to store an Address in the database

Scenario: get form to create new address
  Given I am on the all_addresses page
    And I follow "New Address"
    Then I should be on the create_new_address page

Scenario: successfully create a new address
  Given I am on the create_new_address page
    And I fill in "Address1" with "1234 Maple Street"
    And I fill in "Address2" with "Suite 110"
    And I fill in "City" with "Berkeley"
    And I fill in "State" with "CA"
    And I fill in "Zip" with "94704"

    And I press "Create Address"
    Then I should see "1234 Maple Street, Suite 110, Berkeley CA 94704"

Scenario: create a new address: empty
  Given I am on the create_new_address page
    And I press "Create Address"
    Then I should be on the create_new_addres page
    And I should see "Error: empty fields!"
    And I should not be on the all_addresses page
