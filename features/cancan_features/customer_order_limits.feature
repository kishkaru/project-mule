Feature: As a customer
          So that I can not make edits on the website
          I want to have limited access around the website

Background:
        Given a non admin account is set up
        And I am logged in with a user account
        And the following user accounts exist
        | password | password_confirmation | role     | email   |
        | aaaaaaaa | aaaaaaaa              | admin    | r@b.com |
        | bbbbbbbb | bbbbbbbb              | user     | q@b.com |
        | cccccccc | cccccccc              | customer | d@b.com |
        | dddddddd | dddddddd              | server   | d@s.com |

        And the following DeliveryAreas exist:
        | name | 
        | Cory |
        | Evans|
        | Soda |


Scenario: Cannot see edit options
Given I am on the homepage
Then I should see "Let's get started! Where are you?"
When I select "Cory" from "customer_area_id"
And I press Update
Then I should see "Menu"
And I should not see "Edit"
