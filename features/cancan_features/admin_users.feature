Feature: As an admin
          So that I can organize users
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
        And the following user accounts exist
        | password | password_confirmation | role     | email   | first_name | last_name | phone_number |
        | aaaaaaaa | aaaaaaaa              | admin    | r@b.com | a          | b         | 1 123 123-1231 |
        | bbbbbbbb | bbbbbbbb              | user     | q@b.com | a          | b         | 1 123 123-1231 |
        | cccccccc | cccccccc              | customer | d@b.com | a          | b         | 1 123 123-1231 |
        | dddddddd | dddddddd              | server   | d@s.com | a          | b         | 1 123 123-1231 |



Scenario: Admin can see users list

Given I am on the users page
Then I should see "Listing users"
And I should see "Role"
And I should see "Name"
And I should see "Email"
And I should see "New User"

Scenario: Admin can view a user
Given I am on the users page
Then I should see "Admin a b r@b.com"


Scenario: Admin can edit a user
Given I am on the users page
Then I should see "Customer a b d@b.com"

Scenario: Admin can destroy a user
Given I am on the users page
Then I should see "Server a b d@s.com" 

Scenario: Admin can create a user
Given I am on the users page
Then I should see "New User"

