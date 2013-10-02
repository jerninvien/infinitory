require 'spec_helper'

# describe ReagentsController do

#   # This should return the minimal set of attributes required to create a valid
#   # Reagent. As you add validations to Reagent, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) { { "name" => "MyString" } }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # ReagentsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all reagents as @reagents" do
#       reagent = Reagent.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:reagents).should eq([reagent])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested reagent as @reagent" do
#       reagent = Reagent.create! valid_attributes
#       get :show, {:id => reagent.to_param}, valid_session
#       assigns(:reagent).should eq(reagent)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new reagent as @reagent" do
#       get :new, {}, valid_session
#       assigns(:reagent).should be_a_new(Reagent)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested reagent as @reagent" do
#       reagent = Reagent.create! valid_attributes
#       get :edit, {:id => reagent.to_param}, valid_session
#       assigns(:reagent).should eq(reagent)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Reagent" do
#         expect {
#           post :create, {:reagent => valid_attributes}, valid_session
#         }.to change(Reagent, :count).by(1)
#       end

#       it "assigns a newly created reagent as @reagent" do
#         post :create, {:reagent => valid_attributes}, valid_session
#         assigns(:reagent).should be_a(Reagent)
#         assigns(:reagent).should be_persisted
#       end

#       it "redirects to the created reagent" do
#         post :create, {:reagent => valid_attributes}, valid_session
#         response.should redirect_to(Reagent.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved reagent as @reagent" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Reagent.any_instance.stub(:save).and_return(false)
#         post :create, {:reagent => { "name" => "invalid value" }}, valid_session
#         assigns(:reagent).should be_a_new(Reagent)
#       end

#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Reagent.any_instance.stub(:save).and_return(false)
#         post :create, {:reagent => { "name" => "invalid value" }}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested reagent" do
#         reagent = Reagent.create! valid_attributes
#         # Assuming there are no other reagents in the database, this
#         # specifies that the Reagent created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         Reagent.any_instance.should_receive(:update).with({ "name" => "MyString" })
#         put :update, {:id => reagent.to_param, :reagent => { "name" => "MyString" }}, valid_session
#       end

#       it "assigns the requested reagent as @reagent" do
#         reagent = Reagent.create! valid_attributes
#         put :update, {:id => reagent.to_param, :reagent => valid_attributes}, valid_session
#         assigns(:reagent).should eq(reagent)
#       end

#       it "redirects to the reagent" do
#         reagent = Reagent.create! valid_attributes
#         put :update, {:id => reagent.to_param, :reagent => valid_attributes}, valid_session
#         response.should redirect_to(reagent)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the reagent as @reagent" do
#         reagent = Reagent.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Reagent.any_instance.stub(:save).and_return(false)
#         put :update, {:id => reagent.to_param, :reagent => { "name" => "invalid value" }}, valid_session
#         assigns(:reagent).should eq(reagent)
#       end

#       it "re-renders the 'edit' template" do
#         reagent = Reagent.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Reagent.any_instance.stub(:save).and_return(false)
#         put :update, {:id => reagent.to_param, :reagent => { "name" => "invalid value" }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested reagent" do
#       reagent = Reagent.create! valid_attributes
#       expect {
#         delete :destroy, {:id => reagent.to_param}, valid_session
#       }.to change(Reagent, :count).by(-1)
#     end

#     it "redirects to the reagents list" do
#       reagent = Reagent.create! valid_attributes
#       delete :destroy, {:id => reagent.to_param}, valid_session
#       response.should redirect_to(reagents_url)
#     end
#   end

# end
