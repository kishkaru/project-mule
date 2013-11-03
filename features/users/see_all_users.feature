Feature: see all the users

    As an admin
    So that I can manage all users
    I want to see all the users of my site
    
    Background:
        Given the following user accounts exist
        | account_name | password | role     | phone_number | email   |
        | admin        | aaaaaaaa | admin    | 111-111-1111 | a@b.com |
        | starbucks    | bbbbbbbb | vendor   |              | c@b.com |
        | bob          | cccccccc | customer | 222-222-2222 | d@b.com |
        | joe          | dddddddd | server   | 333-333-3333 | d@s.com |
    
    Scenario: admin should see all users
        Given I am logged in with an admin account
        And I am on the users page
        Then I should see "joe"
        And I should see "bob"
        And I should see "admin"
        And I should see "starbucks"
        And I should see "vendor"
        And I should see "customer"
        And I should see "server"
        And I should see "111-111-1111"
        And I should see "222-222-2222"
        And I should see "333-333-3333"
        And I should see "a@b.com"
        And I should see "c@b.com"
        And I should see "d@b.com"
        And I should see "d@s.com"
        
    Scenario: non admins should not see all users
        Given I am logged in with a user account
        And I am on the users page
        Then I should be on the home page