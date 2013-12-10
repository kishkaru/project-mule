@javascript
Feature: create customer account

    As a customer
    So that I can save my order preferences
    I want to make an account
    
    Background:
        Given I am on the home page
        And I follow "Login"
        And I follow "Sign up"
        Then I should be on the create account page
    
    Scenario: create an account
        Given I fill in "user_password" with "foobarfoo"
        And I fill in "user_password_confirmation" with "foobarfoo"
        And I fill in "user_email" with "foo@gmail.com"
        And I fill in "user_first_name" with "Billy"
        And I fill in "user_last_name" with "Bob"
        And I fill in "user_phone_number" with "+1 (123) 123-1232"
        And I press "Sign up"
        Then I should be on the home page
        And I should see "Welcome! You have signed up successfully"
        And I logout
        And I follow "Login"
        And I fill in "user_email" with "foo@gmail.com"
        And I fill in "user_password" with "foobarfoo"
        And I press "Sign in"
        Then I should see "Signed in successfully"
        
    Scenario: passwords don't match
        Given I fill in "user_password" with "foobargarply1"
        And I fill in "user_password_confirmation" with "foobargarply2"
        And I fill in "user_email" with "foo@gmail.com"
        And I press "Sign up"
        Then I should see "Password doesn't match confirmation"
        Then the "user_email" field should contain "foo@gmail.com" 
        
    Scenario: email empty
        And I fill in "user_email" with "foo"
        And I fill in "user_password" with "foobarfoo"
        And I fill in "user_password_confirmation" with "foobarfoo"
        And I press "Sign up"
        Then the "user_email" field should contain "foo"
    
    Scenario: password empty
        And I fill in "user_email" with "foo@gmail.com"
        And I press "Sign up"
        Then I should see "Password can't be blank"
        And the "user_email" field should contain "foo@gmail.com"
