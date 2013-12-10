class Order < ActiveRecord::Base

    attr_accessible :pickup_date

    belongs_to :user
    belongs_to :delivery_point
    has_many :item_orders
    attr_accessible :transaction_id
end
