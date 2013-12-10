class MenusController < ApplicationController
    # GET /menus
    # GET /menus.json
    def index
        @menus = Menu.page(params[:page])

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @menus }
        end
    end

    # GET /menus/1
    # GET /menus/1.json
    def show
        @menu = Menu.find(params[:id])
        @customer_points = DeliveryPoint.where(delivery_area_id: @menu.delivery_areas.pluck(:id))

        @chosen_point = params[:delivery_point] ? DeliveryPoint.find(params[:delivery_point][:id]) : nil

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @menu }
        end
    end

    # GET /menus/new
    # GET /menus/new.json
    def new
        @menu = Menu.new
        @menu.date = Date.tomorrow

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @menu }
        end
    end

    # GET /menus/1/edit
    def edit
        @menu = Menu.find(params[:id])
    end

    # POST /menus
    # POST /menus.json
    def create
        params[:menu_options] ||= HashWithIndifferentAccess.new
        params[:menu_options][:delivery_areas] ||= []
        params[:menu_options][:items] ||= []
        params[:menu_options][:item_quantities] ||= []
        @delivery_areas = DeliveryArea.where(name: params[:menu_options].delete(:delivery_areas))
        @items = Item.where(id: params[:menu_options].delete(:items)).uniq
        @item_quantities = params[:menu_options].delete(:item_quantities) || {}
        template = params[:menu_options].delete(:template)
        if template.blank? || template == "blank" || template.to_i < 1
            @menu = Menu.new(params[:menu])
        else
            @menu = Menu.new_from_template(template.to_i, params[:menu])
        end

        respond_to do |format|
            if @menu.save
                @menu.delivery_areas = @delivery_areas
                @menu.add_items(@items, @item_quantities) if template == "blank"
                format.html { redirect_to @menu, flash: { success: 'Menu was successfully created.' } }
                format.json { render json: @menu, status: :created, location: @menu }
            else
                format.html { render action: "new" }
                format.json { render json: @menu.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /menus/1
    # PUT /menus/1.json
    def update
        @delivery_areas = DeliveryArea.where(name: params[:menu_options].delete(:delivery_areas))
        @items = Item.where(id: params[:menu_options].delete(:items)).uniq
        @item_quantities = params[:menu_options].delete(:item_quantities) || {}
        @menu = Menu.find(params[:id])

        respond_to do |format|
            if @menu.update_attributes(params[:menu])
                @menu.delivery_areas = @delivery_areas
                @menu.add_items(@items, @item_quantities)
                format.html { redirect_to @menu, flash: { success: 'Menu was successfully updated.'} }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @menu.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /menus/1
    # DELETE /menus/1.json
    def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy

        respond_to do |format|
            format.html { redirect_to menus_url }
            format.json { head :no_content }
        end
    end

end
