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
When I follow "Show" for "r@b.com"
Then I should see "Role"
And I should see "First Name: "

Scenario: Admin can edit a user
Given I am on the users page
And I follow "Edit" for "r@b.com"
Then I should see "Editing user"
And I should see "Role"
And I should see "Password"
And I should see "Update User"

Scenario: Admin can destroy a user
Given I am on the users page
And I follow "Destroy" for "r@b.com"
When I confirm popup
And I am on the users page
Then I should not see "r@b.com"

Scenario: Admin can create a user
Given I am on the users page
Then I should see "New User"

