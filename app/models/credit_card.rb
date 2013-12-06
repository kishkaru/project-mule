class CreditCard < ActiveRecord::Base

    validates_presence_of :token

    belongs_to :user

end