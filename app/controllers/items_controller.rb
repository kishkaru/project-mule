class ItemsController < ApplicationController

    include ItemsHelper

    # GET /items
    # GET /items.json
    def index
        @items = Item.all

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @items }
        end
    end

    # GET /items/1
    # GET /items/1.json
    def show
        @item = Item.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @item }
        end
    end

    # GET /items/new
    # GET /items/new.json
    def new
        @item = Item.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @item }
        end
    end

    # GET /items/1/edit
    def edit
        @item = Item.find(params[:id])
    end

    # POST /items
    # POST /items.json
    def create
        ingredients = []
        ingredients = params[:item].delete(:ingredients).collect{|name| Ingredient.find_or_create_by_name(name)} if params[:item][:ingredients]

        @item = Item.new(params[:item])
        @item.ingredients = ingredients

        respond_to do |format|
            if @item.save
                format.html { redirect_to @item, notice: 'Item was successfully created.' }
                format.json { render json: @item, status: :created, location: @item }
            else
                flash[:error] = "Error: empty fields!"
                flash.keep
                format.html { redirect_to action: "new" }
                format.json { render json: @item.errors, status: :unprocessable_entity }
            end
        end

    end

    # PUT /items/1
    # PUT /items/1.json
    def update
        ingredients = []
        ingredients = params[:item].delete(:ingredients).collect{|name| Ingredient.find_or_create_by_name(name)} if params[:item][:ingredients]

        @item = Item.find(params[:id])
        @item.ingredients = ingredients

        respond_to do |format|
            if @item.update_attributes(params[:item])
                format.html { redirect_to @item, notice: 'Item was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @item.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /items/1
    # DELETE /items/1.json
    def destroy
        @item = Item.find(params[:id])
        @item.destroy

        respond_to do |format|
            format.html { redirect_to items_url }
            format.json { head :no_content }
        end
    end

    # Adds item with id in params[:item_to_add] to the cart in session hash
    def addItemToCart
        id = params[:item_to_add].to_i
        new_quantity = getOldQuantity(id) + 1
        session[:cart][:items][id] = new_quantity
        redirect_to cart_path
    end

    # Remove item with id in parms[:item_to_add] from the cart in session hash
    def minusItemFromCart
        id = params[:item_to_minus].to_i
        new_quantity = getOldQuantity(id) - 1
        if new_quantity > 0
            session[:cart][:items][id] = new_quantity
        else
            session[:cart][:items][id] = 0
        end
        redirect_to cart_path
    end

    # Gets the quantity of item in the card with id = ID
    # or returns 0 if item is not in cart
    def getOldQuantity(id)
        old_quantity = 0
        if session[:cart][:items][id.to_i]
            old_quantity = session[:cart][:items][id.to_i]
        end
        old_quantity
    end

    # Remove the item in params[:item_to_remove] from the cart
    def removeItemFromCart
        session[:cart][:items].delete(params[:item_to_remove].to_i);
        redirect_to cart_path
    end
end
