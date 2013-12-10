class MainController < ApplicationController

    def home
        #@areas_and_menus = {}
        #today = Time.now.to_s.split.first
        #DeliveryArea.all.each do |area|
        #	@areas_and_menus[area] = Menu.where("date like?", "#{today}%").where(:delivary_areas => area).first
        #end
        @delivery_areas = DeliveryArea.all
    end

    def goToMenu
        #@customer_choice = DeliveryArea.find(1)
        #redirect_to @customer_choice
        @delivery_area = params[:customer_area][:id]

        redirect_to menu_delivery_area_path(@delivery_area)
    end

end
