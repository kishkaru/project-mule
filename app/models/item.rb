class Item < ActiveRecord::Base
  attr_accessible :description, :expires_at, :name, :price, :quantity
end
