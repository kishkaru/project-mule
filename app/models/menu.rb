class Menu < ActiveRecord::Base
    attr_accessible :date
    has_many :items, :class_name => "MenuItem"
    has_many :item_templates, :through => :items, :source => :item
    has_many :delivery_areas
    validates :date, presence: true

    def self.new_from_template(template_id, params=HashWithIndifferentAccess.new)
        template = Menu.find(template_id)
        new_menu = Menu.new(params)
        new_menu.items = template.items
        return new_menu
    end

    def add_items(items_to_add)
        to_destroy = []
        self.items.each do |menu_item|
            if items_to_add.include?(menu_item.item)
                items_to_add = items_to_add - [menu_item.item]
            else
                to_destroy << menu_item
            end
        end
        to_destroy.each{|menu_item| menu_item.destroy}

        items_to_add.each do |item|
            self.items << item.create_menu_item
        end
    end
end
