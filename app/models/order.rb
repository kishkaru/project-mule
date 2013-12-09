class Order < ActiveRecord::Base
    belongs_to :user
    belongs_to :delivery_point
    has_many :item_orders
    attr_accessible :transaction_id
end
