Feature: As an admin
          So that I can organize vendor
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
        Given the following vendors exist:
      | name | address | email   |                             
      | Chipotle    | 1234 Maple Street, Berkeley, CA, 94704 |buro@chipotle.com |
      | La Buritta  | 4321 Grape Avenue, Berkeley, CA, 94709 |churro@laburitta.com |
      | Cheeseboard | 987 Oak Way, Berkeley, CA, 94705       |  duro@cheeseboard.com |




Scenario: Admin can see options to create, edit, show and delete a vendor

Given I am on the all_vendors page
Then I should see "Listing vendors"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Vendor"

Scenario: Admin can view a vendor
Given I am on the all_vendors page
Then I should see "Chipotle 1234 Maple Street Berkeley, CA 94704 buro@chipotle.com Show"


Scenario: Admin can edit a vendor
Given I am on the all_vendors page
Then I should see "Chipotle 1234 Maple Street Berkeley, CA 94704 buro@chipotle.com Show Edit"

Scenario: Admin can destroy a vendor
Given I am on the all_vendors page
Then I should see "Chipotle 1234 Maple Street Berkeley, CA 94704 buro@chipotle.com Show Edit Destroy"

Scenario: Admin can create a vendor
Given I am on the all_vendors page
Then I should see "New Vendor"

