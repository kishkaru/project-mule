class UsersController < ApplicationController
    include SmsHelper


    load_and_authorize_resource

    before_filter :user_logged_in, :only => :account


    include UsersHelper
    # GET /users
    # GET /users.json
    def index
        @users = User.page(params[:page])

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @users }
        end
    end

    # GET /users/1
    # GET /users/1.json
    def show
        @user = User.find(params[:id])
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @user }
        end
    end

    # GET /users/new
    # GET /users/new.json
    def new
        @user = User.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @user }
        end
    end

    # GET /users/1/edit
    def edit
        @user = User.find(params[:id])
    end

    # POST /users
    # POST /users.json
    def create
        if params[:user_options][:role] == "3"
            @user = Server.new
        else
            @user = User.new
        end

        respond_to do |format|
            if update_user_attributes(@user)
                AdminMailer.new_registration(@user).deliver
                UserMailer.welcome_email(@user).deliver
                @user = User.find(@user.id)
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.json { render json: @user, status: :created, location: @user }
            else
                error_user = User.new
                @user.attributes.each do |attr, val|
                    error_user.send("#{attr}=", val)
                end
                @user = error_user
                @user.valid?
                format.html { render action: "new" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /users/1
    # PUT /users/1.json
    def update
        if params[:user_options][:role] == "3"
            @user = Server.find(params[:id])
        else
            @user = User.find(params[:id])
        end

        old_role = @user.role

        respond_to do |format|
            if update_user_attributes(@user)
                if @user.role != "3" && old_role == "3"
                    area = DeliveryArea.find_by_server_id(@user.id)
                    if area
                        area.server_id = nil
                    end
                end
                @user = User.find(@user.id)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { head :no_content }
            else
                error_user = User.new
                @user.attributes.each do |attr, val|
                    error_user.send("#{attr}=", val)
                end
                @user = error_user
                @user.valid?
                format.html { render action: "edit" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user = User.find(params[:id])
        @user.destroy

        respond_to do |format|
            format.html { redirect_to users_url }
            format.json { head :no_content }
        end
    end

    # Shows user account info to the user
    def account
        @orders = current_user.orders.page(params[:page])
    end

    def notify_pickup
        @user = User.find_by_id(params[:id])
        send_sms(@user.phone_number.asString, "Your LuckyBolt order is ready for pickup!")

        render :partial => 'delivery_points/send_sms'
    end

end
