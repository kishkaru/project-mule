class DeliveryPointsController < ApplicationController
    include SmsHelper
    # GET /delivery_points
    # GET /delivery_points.json
    load_and_authorize_resource
    def index
        if state = params.delete(:state)
            @delivery_points = DeliveryPoint.joins(:address).where("addresses.state = '#{state}'").page(params[:page])
        else
            @delivery_points = DeliveryPoint.page(params[:page])
        end

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @delivery_points.collect{|point| point.attributes.merge(:address => point.address.to_s)} }
        end
    end

    # GET /delivery_points/1
    # GET /delivery_points/1.json
    def show
        @delivery_point = DeliveryPoint.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @delivery_point }
        end
    end

    # GET /delivery_points/new
    # GET /delivery_points/new.json
    def new
        @delivery_point = DeliveryPoint.new
        @delivery_point.build_address

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @delivery_point }
        end
    end

    # GET /delivery_points/1/edit
    def edit
        @delivery_point = DeliveryPoint.find(params[:id])
    end

    # POST /delivery_points
    # POST /delivery_points.json
    def create
        @delivery_point = DeliveryPoint.new(params[:delivery_point])

        respond_to do |format|
            if @delivery_point.save
                format.html { redirect_to @delivery_point, notice: 'Delivery point was successfully created.' }
                format.json { render json: @delivery_point, status: :created, location: @delivery_point }
            else
                format.html { render action: "new" }
                format.json { render json: @delivery_point.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /delivery_points/1
    # PUT /delivery_points/1.json
    def update
        @delivery_point = DeliveryPoint.find(params[:id])
        respond_to do |format|
            if @delivery_point.update_attributes(params[:delivery_point])
                format.html { redirect_to @delivery_point, notice: 'Delivery point was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @delivery_point.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /delivery_points/1
    # DELETE /delivery_points/1.json
    def destroy
        @delivery_point = DeliveryPoint.find(params[:id])
        @delivery_point.destroy

        respond_to do |format|
            format.html { redirect_to delivery_points_url }
            format.json { head :no_content }
        end
    end

    def notify_pickup
        @delivery_point =DeliveryPoint.find(params[:id])
        @orders = @delivery_point.orders
        logger.info("Notifying Pickup for Delivery Point #{@delivery_point.id}: #{@delivery_point.address.to_s}")

        @orders.each do |order|
            send_sms(order.user.phone_number.asString, "Your LuckyBolt order is ready for pickup!")
        end

        render :partial => 'delivery_points/send_sms'
    end

end
