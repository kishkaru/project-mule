Feature: Login to LuckyBolt

    As an user of Luckybolt
    So that I can view my account
    I want to login
    
    Background:
        Given the following user accounts exist
        | user_name | password | type     |
        | admin     | aaaaaaaa | admin    | 
        | vendor    | bbbbbbbb | vendor   |
        | customer  | cccccccc | customer |
        | server    | dddddddd | server   |
           
    Scenario: Admin login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login home page
        And I fill in "user_name" with "admin"
        And I fill in "password" with "aaaaaaaa"
        And I press "Login"
        Then I should see "Admin Dashboard"
        
    Scenario: Vendor login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login home page
        And I fill in "user_name" with "vendor"
        And I fill in "password" with "bbbbbbbb"
        And I press "Login"
        Then I should see "Vendor Dashboard"
  
    Scenario: Customer login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login home page
        And I fill in "user_name" with "customer"
        And I fill in "password" with "cccccccc"
        And I press "Login"
        Then I should see "Customer Dashboard"
       
    Scenario: Server login to LuckyBolt
        Given I am on the home page
        And I press "Login"
        Then I should be on the login home page
        And I fill in "user_name" with "server"
        And I fill in "password" with "dddddddd"
        And I press "Login"
        Then I should see "Server Dashboard"