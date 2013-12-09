@javascript
Feature: log out of account

    As a user
    So that I can protect my account information
    I want to logout

    Background:
        Given slow for selenium

    Scenario: log out of account
    	Given a non admin account is set up
        And I am logged in with a user account
        And I logout
        Then I should be on the home page
        And I should see "Signed out successfully"