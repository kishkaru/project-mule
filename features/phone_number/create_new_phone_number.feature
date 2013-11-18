Feature: create a new phone number to be stored in the database

  As an admin
  So that I can associate phone numbers with vendors and users
  I want to store a Phone Number in the database

Scenario: get form to create new phone number
  Given I am on the all_phone_numbers_ page
    And I follow "New Phone Number"
    Then I should be on the create_new_phone_number page

Scenario: successfully create a new phone number
  Given I am on the create_new_phone_number page
    And I fill in "Area" with "510"
    And I fill in "Number" with "234-5678"

    And I press "Create Phone Number"
    Then I should see "510-234-5678"

Scenario: create a new phone number: empty
  Given I am on the create_new_phone_number page
    And I press "Create Phone Number"
    Then I should be on the create_new_phone_number page
    And I should see "Error: empty fields!"
    And I should not be on the all_phone_numbers page
