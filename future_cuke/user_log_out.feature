Feature: log out of account

    As a user
    So that I can protect my account information
    I want to log out
    
    Scenario: log out of account
        Given I am logged in with a user account
        And I press "Log out"
        Then I should be on the home page
        And I should see "Log out successful"