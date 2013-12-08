class ApplicationController < ActionController::Base
    protect_from_forgery
    rescue_from CanCan::AccessDenied do|exception|
      flash[:error] = "Access denied."
      redirect_to root_url
    end
    before_filter :initialize_cart



    protected

    def initialize_cart
        session[:cart] ||= HashWithIndifferentAccess.new()
        session[:cart][:items] ||= HashWithIndifferentAccess.new()
    end
end
