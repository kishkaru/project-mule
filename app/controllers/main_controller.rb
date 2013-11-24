class MainController < ApplicationController
  def home
    @delivery_area = DeliveryArea.all
    @customer_area = DeliveryArea.new(params[:customer_area])
  end
  def redirect
    @customer_choice = DeliveryArea.find(1)
    redirect_to @customer_choice
 end
end
