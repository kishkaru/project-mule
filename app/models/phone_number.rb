class PhoneNumber < ActiveRecord::Base
    belongs_to :vendor
    belongs_to :user
    attr_accessible :area, :country, :extension, :number
end
