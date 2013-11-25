class DeliveryPointsController < ApplicationController
    # GET /delivery_points
    # GET /delivery_points.json
    def index
        @delivery_points = DeliveryPoint.all

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @delivery_points }
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
end
