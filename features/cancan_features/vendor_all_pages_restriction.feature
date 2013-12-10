Feature: As a vendor
          So that I can make the orders
          I want to view only pages related to making my orders

Background:
  Given a non admin account is set up
  And I am logged in with a vendor account

  And the following user accounts exist
  | password | password_confirmation | role     | email   | first_name | last_name | phone_number |
  | aaaaaaaa | aaaaaaaa              | admin    | r@b.com | a          | b         | 1 123 123-1231 |
  | bbbbbbbb | bbbbbbbb              | user     | q@b.com | a          | b         | 1 123 123-1231 |
  | cccccccc | cccccccc              | customer | d@b.com | a          | b         | 1 123 123-1231 |
  | dddddddd | dddddddd              | server   | d@s.com | a          | b         | 1 123 123-1231 |
  

        

Scenario: Vendor cannot see all users page
Given I am on the users page
Then I should be on the home page


Scenario: Vendor cannot view all menus page
Given I am on the menus page
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
