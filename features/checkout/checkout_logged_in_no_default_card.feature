Feature: Checkout and pay for logged in user without a default credit card

    As a Customer
    So that I can place my order without having added a credit card
    I want to checkout
    
    Background:
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
        And a non admin account is set up
        And I am logged in with a user account

    @javascript
    Scenario: See checkout for logged in user without default credit card
        Given I follow "cart_link"
        And I press "Checkout"
        Then I should see "Credit Card Info"
        And I should not see "Guest Info"

    @javascript
    Scenario: Place order as logged in user without default credit card
        Given I follow "cart_link"
        And I press "Checkout"
        And I fill in "credit_card_card_number" with "4111-1111-1111-1111"
        And I fill in "credit_card_exp_date" with "12/2020"
        And I press "Pay"


    @javascript
    Scenario: Place order as logged in user without default credit card and invalid credit card info
        Given I follow "cart_link"
        And I press "Checkout"
        And I press "Pay"
