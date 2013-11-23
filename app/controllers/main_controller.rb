class MainController < ApplicationController
  def home
    @delivery_area = DeliveryArea.all
    @customer_area = nil
  end
  def find
    if params[:id] != nil 
    	redirect_to DeliveryArea.find(params[:id])
    end
 end
end
