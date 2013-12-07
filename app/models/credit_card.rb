class CreditCard < ActiveRecord::Base

    validates_presence_of :token

    attr_accessible :token, :last_four

    belongs_to :user

end