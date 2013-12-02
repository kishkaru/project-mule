Feature: As a vendor
          So that I can make the orders
          I want to vie wonly pages related to making my orders

Background:
  Given a non admin account is set up
  And I am logged in with a vendor account

  And the following user accounts exist
  | password | password_confirmation | role     | email   |
  | aaaaaaaa | aaaaaaaa              | admin    | r@b.com |
  | bbbbbbbb | bbbbbbbb              | user     | q@b.com |
  | cccccccc | cccccccc              | customer | d@b.com |
  | dddddddd | dddddddd              | server   | d@s.com |
  | eeeeeeee | eeeeeeee              | vendor   | e@s.com |
  
  Then I should be on the home page

        

Scenario: Vendor cannot see all users page
Given I am on the users page
Then I should be on the home page


Scenario: Vendor cannot view all menus page
Given I am on the all_menus page
Then I should be on the home page

Scenario: Vendor cannot see all vendors page
Given I am on the all_vendors page
Then I should be on the home page

Scenario: Vendor cannot view all items page
Given I am on the all_items page
Then I should be on the home page

Scenario: Vendor cannot view all ingredients page
Given I am on the all_ingredients page
Then I should be on the home page

Scenario: Vendor cannot view all delivery areas page
Given I am on the Listing delivery_areas page
Then I should be on the home page

Scenario: Vendor cannot view all delivery points page
Given I am on the Listing delivery_areas page
Then I should be on the home page
