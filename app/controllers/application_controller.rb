class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :initialize_cart


    protected

    def initialize_cart
        session[:cart] ||= HashWithIndifferentAccess.new()
        session[:cart][:items] ||= HashWithIndifferentAccess.new()
    end

    # Before filter for if user is logged in
    def user_logged_in
        redirect_to(root_path) unless user_signed_in?
    end

    def verify_if_admin
        if current_user.nil?
            redirect_to(root_path) and return
        else
            redirect_to(root_path) and return unless current_user.admin?
        end
    end
end
