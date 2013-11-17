Feature: create a user

    As an admin
    So that I can assign users different roles
    I want to create user accounts with different roles
    
    Background:
        Given the admin account is set up

    Scenario: create a user
        Given I am logged in with an admin account
        And I am on the users page
        And I follow "New User"
        And I fill in "user_password" with "foobarfoo"
        And I fill in "user_password_confirmation" with "foobarfoo"
        And I fill in "user_first_name" with "bobby"
        And I fill in "user_last_name" with "flay"
        And I fill in "user_email" with "bobbyflay@flay.com"
        And I fill in "user_phone_number" with "+1 (415) 123-4567"
        And I select "Server" from "user_role"
        And I press "Create User"
        Then I should be on the users page for "bobbyflay@flay.com"
        And I should see "bobby"
        And I should see "flay"
        And I should see "bobbyflay@flay.com"
        And I should see "Server"
        And I should see "+1 (415) 123-4567"