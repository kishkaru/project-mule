Feature: As a server
          So that I can make an order
          I want to view only pages related to an order

Background:
        Given a non admin account is set up

        And the following user accounts exist 
        | password | password_confirmation | role     | email   | first_name | last_name | phone_number |
        | aaaaaaaa | aaaaaaaa              | admin    | r@b.com | a          | b         | 1 123 123-1231 |
        | bbbbbbbb | bbbbbbbb              | user     | q@b.com | a          | b         | 1 123 123-1231 |
        | cccccccc | cccccccc              | customer | d@b.com | a          | b         | 1 123 123-1231 |
        | dddddddd | dddddddd              | server   | d@s.com | a          | b         | 1 123 123-1231 |


        And I am logged in with a server account

        And the following orders exist
        | user_id | transaction_id | 
        | 1 | aaaaaaaa      | 
        | 2 | bbbbbbbb      | 
        | 3 | cccccccc      | 
        | 4 | dddddddd      |


       And the following DeliveryAreas exist:
       |name|
       |F&M District|
       |Berkeley|
       |Mission|

Scenario: Server cannot see all users page
Given I am on the users page
Then I should be on the home page


Scenario: Server cannot view all menus page
Given I am on the menus page
Then I should be on the home page

Scenario: Server cannot see all vendors page
Given I am on the all_vendors page
Then I should be on the home page

Scenario: Server cannot view all items page
Given I am on the all_items page
Then I should be on the home page

Scenario: Server cannot view all ingredients page
Given I am on the all_ingredients page
Then I should be on the home page

Scenario: Server cannot view all delivery areas page
Given I am on the Listing delivery_areas page
Then I should be on the home page

Scenario: Server cannot view all delivery points page
Given I am on the Listing delivery_areas page
Then I should be on the home page

Scenario: Server can view orders page
Given I am on the orders page for "F&M District"
Then I should see "To Be Picked Up On"
