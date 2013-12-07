class CreditCard < ActiveRecord::Base

    validates_presence_of :token, :last_four

    attr_accessible :token, :last_four, :default

    belongs_to :user

end