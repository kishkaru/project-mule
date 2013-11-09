Feature: Login to LuckyBolt

    As an user of Luckybolt
    So that I can view my account
    I want to login
    
    Background:
        Given the following user accounts exist
        | password | password_confirmation | role     | email   |
        | aaaaaaaa | aaaaaaaa              | admin    | c@b.com |
        | bbbbbbbb | bbbbbbbb              | vendor   | b@c.com |
        | cccccccc | cccccccc              | customer | f@g.com |
        | dddddddd | dddddddd              | server   | g@h.com |
           
    Scenario: Admin login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login page
        And I fill in "email" with "admin"
        And I fill in "password" with "aaaaaaaa"
        And I press "Sign in"
        Then I should see "Signed in successfully"
        
    Scenario: Vendor login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login page
        And I fill in "email" with "vendor"
        And I fill in "password" with "bbbbbbbb"
        And I press "Sign in"
        Then I should see "Signed in successfully"
  
    Scenario: Customer login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login page
        And I fill in "email" with "customer"
        And I fill in "password" with "cccccccc"
        And I press "Sign in"
        Then I should see "Signed in successfully"
       
    Scenario: Server login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login page
        And I fill in "email" with "server"
        And I fill in "password" with "dddddddd"
        And I press "Sign in"
        Then I should see "Signed in successfully"