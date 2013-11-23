class MainController < ApplicationController
  def home
    @delivery_area = DeliveryArea.all
  end
  def find 
    redirect_to params[:id]
  end
end
