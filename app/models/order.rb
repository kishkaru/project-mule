class Order < ActiveRecord::Base
    belongs_to :user
    has_many :item_orders
    attr_accessible :transaction_id
end
