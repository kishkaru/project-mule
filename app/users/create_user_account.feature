Feature: create customer account

    As a customer
    So that I can save my order preferences
    I want to make an account
    
    Background:
        Given that I am on the home page
        And I press "Login"
        And I follow "Sign Up"
        Then I should be on the create account page
    
    Scenario: create an account
        And I fill in "account_name" with "foo"
        And I fill in "password" with "foodbarfoo"
        And I fill in "verify_password" with "foobarfoo"
        And I fill in "email" with "foo@gmail.com"
        And I press "Create Account"
        Then I should be on login home page
        And I should see "Customer Dashboard"
        And I press "Log out"
        And I press "Login"
        And I fill in "user_name" with "foo"
        And I fill in "password" with "foobarfoo"
        And I press "Login"
        Then I should see "Customer Dashboard"
        
    Scenario: passwords don't match
        And I fill in "account_name" with "foo"
        And I fill in "password" with "foobargarply1"
        And I fool in "verify_password" with "foobargarply2"
        And I fill in "email" with "foo@gmail.com"
        And I press "Create Account"
        Then I should be on create account page
        And I should see "Passwords do not match"
        And I should see "foo"
        And I should see "foo@gmail.com" 
        
    Scenario: email empty
        And I fill in "account_name" with "foo"
        And I fill in "password" with "foobarfoo"
        And I fill in "verify_password" with "foobarfoo"
        And I press "Create Account"
        Then I should be on the create account page
        And I should see "E-mail required"
        And I should see "foo"
    
    Scenario: password empty
        And I fill in "account_name" with "foo"
        And I fill in "email" with "foo@gmail.com"
        And I press "Create Account"
        Then I should be on the create account page
        And I should see "Password required"
        And I should see "foo"
        And I should see "foo@gmail.com"

    Scenario: account name empty
        And I fill in "password" with "foobarfoo"
        And I fill in "verify_password" with "foobarfoo"
        And I fill in "email" with "foo@gmail.com"
        And I press "Create Account"
        Then I should be on the create account page
        And I should see "Account name required"
        And I should see "foo"
        And I should see "foo@gmail.com"
        
    Scenario: invalid phone number
        And I fill in "account_name" with "foo"
        And I fill in "password" with "foodbarfoo"
        And I fill in "verify_password" with "foobarfoo"
        And I fill in "email" with "foo@gmail.com"
        And I fill in "phone_number" with "234"
        And I press "Create Account"
        Then I should be on create account page
        And I should see "Invalid phone number"
        And I should see "foo"
        And I should see "foo@gmail.com"