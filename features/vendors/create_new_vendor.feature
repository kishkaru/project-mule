Feature: create a new vendor to be stored in the database

  As an admin
  So that I can create Items from a Vendor to add to aMenu
  I want to store a Vendor in the database

Scenario: get form to create new Vendor
  Given I am on the all_vendors page
    And I follow "New Vendor"
    Then I should be on the create_new_vendor page

@javascript
Scenario: successfully create a new Vendor
    Given slow for selenium
    Given I am on the create_new_vendor page
    And I fill in "Name" with "Chipotle"
    And I fill in "Email" with "bandito@chipotle.com"
    And I fill in "vendor_address_attributes_line1" with "123 Dwight"
    And I fill in "vendor_address_attributes_city" with "Berkeley"
    And I fill in "vendor_address_attributes_state" with "CA"
    And I fill in "vendor_address_attributes_zip" with "12345"
    And I press "Create Vendor"
    Then I should see "Chipotle"
    And I should see "123 Dwight Berkeley, CA 12345"

Scenario: create a new vendor: empty
    Given I am on the create_new_vendor page
    And I press "Create Vendor"
    And I should see "Name can't be blank"
    And I should see "Email can't be blank"
    And I should see "Address city can't be blank"
    And I should see "Address line1 can't be blank"
    And I should see "Address state can't be blank"
    And I should see "Address zip can't be blank"
