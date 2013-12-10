Feature: As a vendor
        So that I can not place an order
        I want to have limited access around the website

Background:
  And the following menus exist:
	   | date |
	   | December 7, 2013 |
	   | December 9, 2013 |
	   | December 10, 2013 |

  And a non admin account is set up
  And I am logged in with a user account
  And the following user accounts exist
  | password | password_confirmation | role     | email   | first_name | last_name | phone_number |
  | aaaaaaaa | aaaaaaaa              | admin    | r@b.com | a          | b         | 1 123 123-1231 |
  | bbbbbbbb | bbbbbbbb              | user     | q@b.com | a          | b         | 1 123 123-1231 |
  | cccccccc | cccccccc              | customer | d@b.com | a          | b         | 1 123 123-1231 |
  | dddddddd | dddddddd              | server   | d@s.com | a          | b         | 1 123 123-1231 |
  
  Scenario: Cannot place an order
  Given I am on the menus page
  Then I should not see "Add to cart"
