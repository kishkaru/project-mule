Feature: create a user

    As an admin
    So that I can assign users different roles
    I want to create user accounts with different roles
    
    Scenario: create a user
        Given I am logged in with an admin account
        And I am on the users page
        And I follow "New User"
        And I fill in "password" with "foobarfoo"
        And I fill in "verify_password" with "foobarfoo"
        And I fill in "first_name" with "bobby"
        And I fill in "last_name" with "flay"
        And I fill in "email" with "bobbyflay@flay.com"
        And I select "Server" from "role"
        And I press "Create User"
        Then I should be on the users page
        And I should see "bobby flay"
        And I should see "bobbyflay@flay.com"
        And I should see "Server"