Feature: As an admin
          So that I can organize delivery points and areas
          I want to be assigned full control over those pages

Background:
        Given the admin account is set up
        And I am logged in with an admin account
        And the following DeliveryAreas exist:
           |name|
           |F&M District|
           |Berkeley|
           |Mission|
    

Scenario: Admin can see options to create, edit, show and delete a delivery area
Given I am on the Listing delivery_areas page
Then I should see "Listing delivery_areas"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Delivery area"

Scenario: Admin can view a delivery area
Given I am on the Listing delivery_areas page
And I follow "Show" for "Berkeley"
Then I should see "Name: Berkeley"

Scenario: Admin can edit a delivery area
Given I am on the Listing delivery_areas page
And I follow "Edit" for "Berkeley"
Then I should see "Name"
And I should see "Update Delivery area" button

Scenario: Admin can destroy a delivery area
Given I am on the Listing delivery_areas page
And I follow "Destroy" for "Berkeley"
When I confirm popup
And I am on the Listing delivery_areas page
Then I should not see "Berkeley"

Scenario: Admin can create a delivery area
Given I am on the Listing delivery_areas page
Then I should see "New Delivery area"

Scenario: Admin can see option to create, edit, view and delete a delivery point
Given I am on the Listing delivery_points page
Then I should see "Listing delivery_points"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Delivery point"

Scenario: Admin can view a delivery point
Given I am on the Listing delivery_areas page
And I follow "Show" for "123 dwight way Berkeley, Ca 12345"
Then I should see "Address: 123 dwight way Berkeley, Ca 12345"
And I should see "Latitude"
And I should see "Longitude"

Scenario: Admin can edit a delivery point
Given I am on the Listing delivery_areas page
And I follow "Edit" for "123 dwight way Berkeley, Ca 12345"
Then I should see "Editing delivery_point"
And I should see "Update Delivery point" button

Scenario: Admin can destroy a delivery point
Given I am on the Listing delivery_areas page
And I follow "Destroy" for "123 dwight way Berkeley, Ca 12345"
When I confirm popup
And I am on the Listing delivery_points page
Then I should not see "123 dwight way Berkeley, Ca 12345"

Scenario: Admin can create a delivery point
Given I am on the Listing delivery_points page
Then I should see "New Delivery point"
