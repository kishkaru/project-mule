Feature: Home Page

    As a guest
    So that I can use LuckyBolt for food
    I want to be able to Create an Account

Background: On the Home Page
    Given I am on the home page

Scenario: Sign Up
    When I follow "Login"
    Then I should be on the login page
