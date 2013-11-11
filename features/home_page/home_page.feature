Feature: Home Page

    As a guest
    So that I can use LuckyBolt for food
    I want to be able to Create an Account

Background: On the Home Page
    Given I am on page "Home"

Scenario: successfully see all delivery points
    When I type "user@luckybolt.com" into "enter-email"
    And I click "sign-up"
    Then I should be on page "sign_up"
