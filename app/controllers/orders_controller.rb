class OrdersController < ApplicationController

    load_and_authorize_resource :only => :show

    # GET /orders
    # GET /orders.json
    def index
        @orders = Order.page(params[:page])

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @orders }
        end
    end

    # GET /orders/1
    # GET /orders/1.json
    def show
        @order = Order.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @order }
        end
    end

    def receipt
    end

    def items
        @order = Order.find(params[:id])
        respond_to do |format|
            format.html { flash[:error] = "That page does not exist" and redirect_to(:root)}
            format.json { render json: {items: @order.item_orders.collect{|item_order| item_order.full_attributes}, customer_name: @order.user.full_name} }
        end
    end

    # Shows the logged in user all their orders
    def user_orders
        @orders = current_user.orders
    end
    
    def update_picked_up
        @order = Order.find_by_id(params[:order])
        @order.picked_up = true
        @order.save!

        render :partial => 'orders/update_pickup'
    end

    def un_update_picked_up
        @order = Order.find_by_id(params[:order])
        @order.picked_up = false
        @order.save!

        render :partial => 'orders/update_pickup'
    end

end
