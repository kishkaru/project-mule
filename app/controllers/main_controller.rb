class MainController < ApplicationController

    def home
        @delivery_area = DeliveryArea.all

    end

    def goToMenu
        #@customer_choice = DeliveryArea.find(1)
        #redirect_to @customer_choice
        @delivery_area = params[:customer_area][:id]

        redirect_to menu_delivery_area_path(@delivery_area)
    end

end
