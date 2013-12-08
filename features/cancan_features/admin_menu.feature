Feature: As an admin
          So that I can organize menu
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
	And the following DeliveryAreas exist:
	   |name|
	   |F&MDistrict|
	   |Berkeley|
	   |Mission|
	And I am on the menus page
	Then I should see "Listing menus"
	When I follow "New Menu"
	And I press "Add Delivery Area"
	And I follow "Create Menu"
	Then I should see "Menu was successfully created."


@javascript
Scenario: Admin can see the "Create Menu" shortcut on homepage
Given I am on the homepage
Then I should see "Create Menu"
And I should see a popup window

Scenario: Admin can see options to create, edit, show and delete a menu
Given I am on the menus page
Then I should see "Listing menus"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Menu"

Scenario: Admin can view a menu
Given I am on the menus page
Then I should see "No Delivery Areas Set December 9th, 2013 Show"


Scenario: Admin can edit a menu
Given I am on the menus page
Then I should see "No Delivery Areas Set December 9th, 2013 Show Edit"


Scenario: Admin can destroy a menu
Given I am on the menus page
Then I should see "No Delivery Areas Set December 9th, 2013 Show Edit Destroy"

Scenario: Admin can create a menu
Given I am on the menus page
Then I should see "New Menu"

