class CreditCard < ActiveRecord::Base

    validates_presence_of :token, :last_four, :type_image_url

    attr_accessible :token, :last_four, :default, :type_image_url

    belongs_to :user

end