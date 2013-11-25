class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :initialize_cart


    protected

    def initialize_cart
        session[:cart] ||= HashWithIndifferentAccess.new()
        session[:cart][:items] ||= HashWithIndifferentAccess.new()
    end
end
