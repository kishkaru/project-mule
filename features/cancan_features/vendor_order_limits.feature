Feature: As a vendor
        So that I can not place an order
        I want to have limited access around the website

Background:
  Given a menu with the following items
  | name    | price | description             | quantity | expires_at |
  | Fries & Shake | 0.39 | Nostaliga | 10 | 11|


  And a non admin account is set up
  And I am logged in with a user account
  And the following user accounts exist
  | password | password_confirmation | role     | email   |
  | aaaaaaaa | aaaaaaaa              | admin    | r@b.com |
  | bbbbbbbb | bbbbbbbb              | user     | q@b.com |
  | cccccccc | cccccccc              | customer | d@b.com |
  | dddddddd | dddddddd              | server   | d@s.com |
  | eeeeeeee | eeeeeeee              | vendor   | e@s.com |
  
  Scenario: Cannot place an order
  Given I am viewing the menu
  Then I should not see "Add to cart"
