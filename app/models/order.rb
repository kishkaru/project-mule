class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :transaction_id
end
