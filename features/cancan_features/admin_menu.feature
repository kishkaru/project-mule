Feature: As an admin
          So that I can organize menu
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
        And a menu with the following items:
      | name    | price | description             | quantity | expires_at |
      | Pasta   |     8 | Penne with tomato sauce |       10 |         12 |
      | Chicken |     9 | Chicken in Gravy        |        9 |         12 |
      | Ribs    |    10 | Ribs in BBQ Sauce       |        0 |         12 |

Scenario: Admin can see the "Create Menu" shortcut on homepage
Given I am on the homepage
Then I should see "Create Menu"
And I should see a popup window

Scenario: Admin can see options to create, edit, show and delete a menu

Given I am on the all_menus page
Then I should see "Listing menus"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Menu"

Scenario: Admin can view a menu
Given I am on the all_menus page
When I follow "Show" for "UC Berkeley Campus"
Then I should see "Menu"
And I should see "Add"

Scenario: Admin can edit a menu
Given I am on the all_menus page
And I follow "Edit" for "UC Berkeley Campus"
Then I should see "Editing Menu"
And I should see "Delivery Areas"
And I should see "Items"
And I should see "Update Menu"

Scenario: Admin can destroy a menu
Given I am on the all_items page
And I follow "Destroy" for "UC Berkeley Campus"
When I confirm popup
And I am on the all_menus page
Then I should not see "UC Berkeley Campus"

Scenario: Admin can create a menu
Given I am on the all_menus page
Then I should see "New Menu"

