require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DeliveryAreasController do

  # This should return the minimal set of attributes required to create a valid
  # DeliveryArea. As you add validations to DeliveryArea, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DeliveryAreasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all delivery_areas as @delivery_areas" do
      delivery_area = DeliveryArea.create! valid_attributes
      get :index, {}, valid_session
      assigns(:delivery_areas).should eq([delivery_area])
    end
  end

  describe "GET show" do
    it "assigns the requested delivery_area as @delivery_area" do
      delivery_area = DeliveryArea.create! valid_attributes
      get :show, {:id => delivery_area.to_param}, valid_session
      assigns(:delivery_area).should eq(delivery_area)
    end
  end

  describe "GET new" do
    it "assigns a new delivery_area as @delivery_area" do
      get :new, {}, valid_session
      assigns(:delivery_area).should be_a_new(DeliveryArea)
    end
  end

  describe "GET edit" do
    it "assigns the requested delivery_area as @delivery_area" do
      delivery_area = DeliveryArea.create! valid_attributes
      get :edit, {:id => delivery_area.to_param}, valid_session
      assigns(:delivery_area).should eq(delivery_area)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DeliveryArea" do
        expect {
          post :create, {:delivery_area => valid_attributes}, valid_session
        }.to change(DeliveryArea, :count).by(1)
      end

      it "assigns a newly created delivery_area as @delivery_area" do
        post :create, {:delivery_area => valid_attributes}, valid_session
        assigns(:delivery_area).should be_a(DeliveryArea)
        assigns(:delivery_area).should be_persisted
      end

      it "redirects to the created delivery_area" do
        post :create, {:delivery_area => valid_attributes}, valid_session
        response.should redirect_to(DeliveryArea.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved delivery_area as @delivery_area" do
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryArea.any_instance.stub(:save).and_return(false)
        post :create, {:delivery_area => { "name" => "invalid value" }}, valid_session
        assigns(:delivery_area).should be_a_new(DeliveryArea)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryArea.any_instance.stub(:save).and_return(false)
        post :create, {:delivery_area => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested delivery_area" do
        delivery_area = DeliveryArea.create! valid_attributes
        # Assuming there are no other delivery_areas in the database, this
        # specifies that the DeliveryArea created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DeliveryArea.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => delivery_area.to_param, :delivery_area => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested delivery_area as @delivery_area" do
        delivery_area = DeliveryArea.create! valid_attributes
        put :update, {:id => delivery_area.to_param, :delivery_area => valid_attributes}, valid_session
        assigns(:delivery_area).should eq(delivery_area)
      end

      it "redirects to the delivery_area" do
        delivery_area = DeliveryArea.create! valid_attributes
        put :update, {:id => delivery_area.to_param, :delivery_area => valid_attributes}, valid_session
        response.should redirect_to(delivery_area)
      end
    end

    describe "with invalid params" do
      it "assigns the delivery_area as @delivery_area" do
        delivery_area = DeliveryArea.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryArea.any_instance.stub(:save).and_return(false)
        put :update, {:id => delivery_area.to_param, :delivery_area => { "name" => "invalid value" }}, valid_session
        assigns(:delivery_area).should eq(delivery_area)
      end

      it "re-renders the 'edit' template" do
        delivery_area = DeliveryArea.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryArea.any_instance.stub(:save).and_return(false)
        put :update, {:id => delivery_area.to_param, :delivery_area => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested delivery_area" do
      delivery_area = DeliveryArea.create! valid_attributes
      expect {
        delete :destroy, {:id => delivery_area.to_param}, valid_session
      }.to change(DeliveryArea, :count).by(-1)
    end

    it "redirects to the delivery_areas list" do
      delivery_area = DeliveryArea.create! valid_attributes
      delete :destroy, {:id => delivery_area.to_param}, valid_session
      response.should redirect_to(delivery_areas_url)
    end
  end

end