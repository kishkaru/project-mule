Feature: create customer account

    As a customer
    So that I can save my order preferences
    I want to make an account
    
    Background:
        Given that I am on the home page
        And I press "Login"
        And I follow "Sign up"
        Then I should be on the create account page
    
    Scenario: create an account
        Given I fill in "password" with "foodbarfoo"
        And I fill in "password_confirmation" with "foobarfoo"
        And I fill in "email" with "foo@gmail.com"
        And I press "Sign up"
        Then I should be on login home page
        And I should see "Welcome! You have signed up successfully"
        And I press "Logout"
        And I press "Login"
        And I fill in "email" with "foo@gmail.com"
        And I fill in "password" with "foobarfoo"
        And I press "Sign in"
        Then I should see "Signed in successfully"
        
    Scenario: passwords don't match
        Given I fill in "password" with "foobargarply1"
        And I fool in "verify_password" with "foobargarply2"
        And I fill in "email" with "foo@gmail.com"
        And I press "Sign up"
        Then I should be on create account page
        And I should see "Password doesn't match confirmation"
        And I should see "foo@gmail.com" 
        
    Scenario: email empty
        And I fill in "email" with "foo"
        And I fill in "password" with "foobarfoo"
        And I fill in "verify_password" with "foobarfoo"
        And I press "Sign up"
        Then I should be on the create account page
        And I should see "Please enter an email address"
        And I should see "foo"
    
    Scenario: password empty
        And I fill in "email" with "foo@gmail.com"
        And I press "Sign up"
        Then I should be on the create account page
        And I should see "Password can't be blank"
        And I should see "foo@gmail.com"
