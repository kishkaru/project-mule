class DeliveryAreasController < ApplicationController
  # GET /delivery_areas
  # GET /delivery_areas.json
  def index
    @delivery_areas = DeliveryArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delivery_areas }
    end
  end

  # GET /delivery_areas/1
  # GET /delivery_areas/1.json
  def show
    @delivery_area = DeliveryArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delivery_area }
    end
  end

  # GET /delivery_areas/new
  # GET /delivery_areas/new.json
  def new
    @delivery_area = DeliveryArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery_area }
    end
  end

  # GET /delivery_areas/1/edit
  def edit
    @delivery_area = DeliveryArea.find(params[:id])
  end

  # POST /delivery_areas
  # POST /delivery_areas.json
  def create
    @delivery_area = DeliveryArea.new(params[:delivery_area])

    respond_to do |format|
      if @delivery_area.save
        format.html { redirect_to @delivery_area, notice: 'Delivery area was successfully created.' }
        format.json { render json: @delivery_area, status: :created, location: @delivery_area }
      else
        format.html { render action: "new" }
        format.json { render json: @delivery_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /delivery_areas/1
  # PUT /delivery_areas/1.json
  def update
    @delivery_area = DeliveryArea.find(params[:id])

    respond_to do |format|
      if @delivery_area.update_attributes(params[:delivery_area])
        format.html { redirect_to @delivery_area, notice: 'Delivery area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_areas/1
  # DELETE /delivery_areas/1.json
  def destroy
    @delivery_area = DeliveryArea.find(params[:id])
    @delivery_area.destroy

    respond_to do |format|
      format.html { redirect_to delivery_areas_url }
      format.json { head :no_content }
    end
  end
end
