class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :initialize_state

    rescue_from CanCan::AccessDenied do|exception|
      flash[:error] = "Access denied."
      redirect_to root_url
    end


    protected

    def initialize_state
        set_current_point
        set_current_menu
        initialize_cart
    end

    def initialize_cart
        session[:cart] ||= HashWithIndifferentAccess.new()
        session[:cart][:items] ||= HashWithIndifferentAccess.new()

        session[:cart][:items].each do |menu_item, qty|
            if MenuItem.find(menu_item).expiration_time <= Time.now
               session[:cart][:items].delete(menu_item)
            end
        end

        @cart_item_count = 0
        session[:cart][:items].each do |item, qty|
            @cart_item_count += qty
        end
        @cart_item_count = "" if @cart_item_count == 0

    end

    def set_current_point
        session[:customer_pickup_point] ||= (current_user.pickup_point.id if user_signed_in? && current_user.pickup_point)

        @current_point = session[:customer_pickup_point] ? DeliveryPoint.find(session[:customer_pickup_point]) : nil
    end

    def update_current_point(point)
        if @current_point && @current_point.delivery_area && point.delivery_area && point.delivery_area.id != @current_point.delivery_area.id
            session[:cart][:items].clear
        end

        current_user.update_attribute(:pickup_point, point) if user_signed_in?
        session[:customer_pickup_point] = point.id

        @current_point = point
        initialize_cart
    end

    def set_current_menu
        @current_menu = @current_point.current_menu if @current_point
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
