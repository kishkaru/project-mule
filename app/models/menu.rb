class Menu < ActiveRecord::Base
    attr_accessible :date
    has_many :items
    has_many :delivery_areas
    validates :date, presence: true

    def self.new_from_template(template_id, params=HashWithIndifferentAccess.new)
        template = Menu.find(template_id)
        new_menu = Menu.new(params)
        new_menu.items = template.items
        return new_menu
    end
end
