Feature: As an admin
          So that I can organize users
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
        And the following user accounts exist
        | password | password_confirmation | role     | email   |
        | aaaaaaaa | aaaaaaaa              | admin    | r@b.com |
        | bbbbbbbb | bbbbbbbb              | user   | q@b.com |
        | cccccccc | cccccccc              | customer | d@b.com |
        | dddddddd | dddddddd              | server   | d@s.com |



Scenario: Admin can see options to create, edit, show and delete a user

Given I am on the users page
Then I should see "Listing users"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New User"

Scenario: Admin can view a user
Given I am on the users page
Then I should see "Admin r@b.com Show"


Scenario: Admin can edit a user
Given I am on the users page
Then I should see "Customer d@b.com Show Edit"

Scenario: Admin can destroy a user
Given I am on the users page
Then I should see "Server d@s.com Show Edit Destroy" 

Scenario: Admin can create a user
Given I am on the users page
Then I should see "New User"

