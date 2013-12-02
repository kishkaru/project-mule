Feature: Checkout and pay

    As a Customer
    So that I can place my order
    I want to checkout
    
    Background:
    
        Given the following items exist:
        | name | vendor | price | description | quantity | expires_at |
        | Regular Burrito | Chipotle | 2.50 | the usual | 55 | 30/6/2020 |
        | Spicy Burrito | Chipotle | 3.50 | on fire | 91 | 3/3/2014 |
        | Carne Asada Burrito | Chipotle | 5.50 | roasted beef | 2 | 12/3/1976 |
        
        Given the following delivery points exist:
        | address | latitude | longitude |
        | 123 Dwight way, Berkeley, CA, 1234 | 12 | 23 |

        And I have added the following items to my cart and have selected the pickup point "123 Dwight way Berkeley, CA 1234":
        | name | qty |
        | Regular Burrito | 2 |
        | Spicy Burrito | 2 |

        And I am on the home page
        And I follow "Cart"
        And I press "Pay"
        
    @javascript
    Scenario: See checkout for guest
        Then I should see "Enter Payment Info"
        And I should see "Name on card"
        And I should see "Card number"
        And I should see "Exp date"
        And I should see "CVV"
        And I should see "Email"
        And I should see "Phone"
        
    @javascript
    Scenario: Submit payment info and order
        Given I fill in "checkout_first_name" with "Billy"
        And I fill in "checkout_last_name" with "Bob"
        And I fill in "checkout_card_number" with "1234567812345678"
        And I fill in "checkout_exp_date" with "12/2200"
        And I fill in "checkout_cvv" with "123"
        And I press "Continue"
        Then I should see "Order Summary"
        And I should see "Items"
        And I should see "Price"
        And I should see "Regular Burrito"
        And I should see "Spicy Burrito"
        And I should see "2"
        And I should see "Total"
        And I should see "$12.00"
        And I should see "$2.50"
        And I should see "$3.50"
        And I should see "Pickup point"
        And I should see "Credit card information"
        And I should see "Billy Bob"
        And I should see "************5678"
        And I should see "123 Dwight way Berkeley, CA 1234"