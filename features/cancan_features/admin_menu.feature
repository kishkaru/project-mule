Feature: As an admin
          So that I can organize menu
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
	And the following menus exist:
	   | date |
	   | December 7, 2013 |
	   | December 9, 2013 |
	   | December 10, 2013 |


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


