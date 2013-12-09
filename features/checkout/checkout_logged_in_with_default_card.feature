@javascript
Feature: Checkout and pay for logged in user with default credit card

    As a Customer
    So that I can place my order
    I want to checkout
    
    Background:
        Given slow for selenium
        Given the following vendors exist:
        | name | address | email|
        | Chipotle | 123 Dwight way, Berkeley, CA, 1234 | chipotle@c.com |

    
        And the following items exist:
        | name | vendor | price | description | quantity |
        | Regular Burrito | Chipotle | 2.50 | the usual | 55 |
        | Spicy Burrito | Chipotle | 3.50 | on fire | 91 |
        | Carne Asada Burrito | Chipotle | 5.50 | roasted beef | 2 |
        
        And the following Delivery Points exist:
        | address | latitude | longitude |
        | 123 Dwight way, Berkeley, CA, 1234 | 12 | 23 |

        And I have added the following items to my cart and have selected the pickup point "123 Dwight way Berkeley, CA 1234":
        | name | qty |
        | Regular Burrito | 2 |
        | Spicy Burrito | 2 |

        And I am on the home page

        And a user is logged in and has the following credit cards set up:
        | number           | exp_date |
        | 4111111111111111 | 12/2020  |
        | 4005519200000004 | 12/2020  |

        And I follow "cart_link"
        And I press "Checkout"

    Scenario: See checkout for logged in user with default credit card
        Then I should see "Use default card"
        And I should see "Use a different credit card"
        And I should see "Use new credit card"
        And I should see the button "Pay with card ending in 1111"

    Scenario: Pay with current default card
    	Given I press "Pay with card ending in 1111"
    	Then I should see "Order #"
    	And I should see "Regular Burrito"
        And I should see "Spicy Burrito"

    Scenario: Defauly card is selected for the "Use a different credit card" option
    	Given I press "Use a different credit card"
    	Then the "cc-ending-1111" checkbox should be checked

    Scenario: Pay with a different card already added
    	Given I press "Use a different credit card"
    	And I choose "cc-ending-0004"
    	And I press "Use selected card"
    	And I press "Pay with card ending in 0004"
    	Then I should see "Order #"
    	And I should see "Regular Burrito"
        And I should see "Spicy Burrito"

    Scenario: Pay with a new invalid card
    	Given I press "Use new credit card"
    	And I press "Save new credit card"
    	Then I should see "Credit card number is required"
        And I should see "Expiration date is required"

    Scenario: Pay with a new valid card
    	Given I press "Use new credit card"
    	And I fill in "credit_card_card_number" with "5555-5555-5555-4444"
    	And I fill in "credit_card_exp_date" with "12/2020"
    	And I press "Save new credit card"
    	And I press "Pay with card ending in 4444"
    	Then I should see "Order #"
    	And I should see "Regular Burrito"
        And I should see "Spicy Burrito"

