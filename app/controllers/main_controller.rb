class MainController < ApplicationController
  def home
    @delivery_area = DeliveryArea.all
    
  end
  def goToMenu
#@customer_choice = DeliveryArea.find(1)
#redirect_to @customer_choice
    @customer_area = DeliveryArea.find(params[:customer_area][:id])
    @customer_points = @customer_area.delivery_points
 end
end
