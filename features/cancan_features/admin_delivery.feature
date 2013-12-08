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
	And the following Delivery Points exist:
	| address| latitude| longitude|
	| 2650 Durant Ave, Berkeley, CA, 12345 | 15.7 | 45.6 |
	| 2521 Hearst Ave, Berkeley, CA, 12345 | 26.3 | 76.7 |
	| 2727 Dwight Way, Berkeley, CA, 12345 | 32.2 | 23.3 |
    

Scenario: Admin can see options to create, edit, show and delete a delivery area
Given I am on the Listing delivery_areas page
Then I should see "Listing delivery_areas"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Delivery area"

Scenario: Admin can view a delivery area
Given I am on the Listing delivery_areas page
Then I should see "Berkeley Show"

Scenario: Admin can edit a delivery area
Given I am on the Listing delivery_areas page
Then I should see "F&M District Show Edit"


Scenario: Admin can destroy a delivery area
Given I am on the Listing delivery_areas page
Then I should see "Mission Show Edit Destroy"


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
Given I am on the Listing delivery_points page
And I should see "2650 Durant Ave Berkeley, CA 12345 15.7 45.6 Show"


Scenario: Admin can edit a delivery point
Given I am on the Listing delivery_points page
Then I should see "2521 Hearst Ave Berkeley, CA 12345 26.3 76.7 Show Edit"

Scenario: Admin can destroy a delivery point
Given I am on the Listing delivery_points page
Then I should see "2727 Dwight Way Berkeley, CA 12345 32.2 23.3 Show Edit Destroy"


Scenario: Admin can create a delivery point
Given I am on the Listing delivery_points page
Then I should see "New Delivery point"
