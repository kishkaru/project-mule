class Menu < ActiveRecord::Base
    attr_accessible :date
    has_many :items, :class_name => "MenuItem"
    has_many :item_templates, :through => :items, :source => :item
    has_and_belongs_to_many :delivery_areas
    validates :date, presence: true

    def self.new_from_template(template_id, params=HashWithIndifferentAccess.new)
        template = Menu.find(template_id)
        new_menu = Menu.new(params)
        new_menu.items = template.cloned_items
        return new_menu
    end

    def cloned_items
        return items.collect do |menu_item|
            menu_item.item.create_menu_item(quantity: menu_item.quantity)
        end
    end

    def add_items(items_to_add, quantities)
        to_destroy = []
        self.items.each do |menu_item|
            if items_to_add.include?(menu_item.item)
                items_to_add = items_to_add - [menu_item.item]
                menu_item.update_attribute(:quantity, quantities[menu_item.item.id.to_s])
            else
                to_destroy << menu_item
            end
        end
        to_destroy.each{|menu_item| menu_item.destroy}

        items_to_add.each do |item|
            self.items << item.create_menu_item(quantity: quantities[item.id.to_s])
        end
    end
end
