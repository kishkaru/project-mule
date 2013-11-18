Feature: create a new vendor to be stored in the database

  As an admin
  So that I can create Items from a Vendor to add to aMenu
  I want to store a Vendor in the database

Scenario: get form to create new Vendor
  Given I am on the all_vendors page
    And I follow "New Vendor"
    Then I should be on the create_new_vendor page

Scenario: successfully create a new Vendor from existing phone number and address
  Given the following phone numbers exist:
      | Area | Number   |
      | 510  | 234-5678 |

  Given the following addresses exist:
      | address1          | address2  | city     | state | zip   |
      | 1234 Maple Street | Suite 110 | Berkeley | CA    | 94704 |

  Given I am on the create_new_vendor page
    And I fill in "Name" with "Chipotle"
    And I select "510-234-5678" from "vendor_phone_number_id"
    And I fill in "Email" with "bandito@chipotle.com"
    And I select "1234 Maple Street, Suite 110, Berkeley CA 94704" from "vendor_address_id"

    And I press "Create Vendor"
    Then I should see "Chipotle"

Scenario: successfully create a new Vendor with new phone number and address
  Given I am on the create_new_vendor page

    And I press "Create New Phone Number"
    Then I should be on the create_new_phone_number page
    When I fill in "Area" with "510"
    And I fill in "Number" with "234-5678"
    And I press "Create Phone Number"
    Then I should be on the create_new_vendor page

    When I press "Create New Address"
    Then I should be on the create_new_address page
    When I fill in "Address1" with "1234 Maple Street"
    And I fill in "Address2" with "Suite 110"
    And I fill in "City" with "Berkeley"
    And I fill in "State" with "CA"
    And I fill in "Zip" with "94704"
    And I press "Create Address"
    Then I should be on the create_new_vendor page

    When I fill in "Name" with "Chipotle"
    And I select "510-234-5678" from "vendor_phone_number_id"
    And I fill in "Email" with "bandito@chipotle.com"
    And I select "1234 Maple Street, Suite 110, Berkeley CA 94704" from "vendor_address_id"

    And I press "Create Vendor"
    Then I should see "Chipotle"

Scenario: create a new vendor: empty
  Given I am on the create_new_vendor page
    And I press "Create Vendor"
    Then I should be on the create_new_vendor page
    And I should see "Error: empty fields!"
    And I should not be on the all_vendors page
