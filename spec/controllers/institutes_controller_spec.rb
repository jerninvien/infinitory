require 'spec_helper'



describe InstitutesController do

  # describe 'as guest' do
  # 	describe "GET index" do
	 #    it "assigns all institutes as @institutes" do
	 #      institute = Institute.create!
	 #      get :index, {}, valid_session
	 #      assigns(:institutes).should eq([institute])
	 #    end
	 #  end
  # end  
end

#   # This should return the minimal set of attributes required to create a valid
#   # Institute. As you add validations to Institute, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) { { "name" => "MyString" } }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # InstitutesController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all institutes as @institutes" do
#       institute = Institute.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:institutes).should eq([institute])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested institute as @institute" do
#       institute = Institute.create! valid_attributes
#       get :show, {:id => institute.to_param}, valid_session
#       assigns(:institute).should eq(institute)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new institute as @institute" do
#       get :new, {}, valid_session
#       assigns(:institute).should be_a_new(Institute)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested institute as @institute" do
#       institute = Institute.create! valid_attributes
#       get :edit, {:id => institute.to_param}, valid_session
#       assigns(:institute).should eq(institute)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Institute" do
#         expect {
#           post :create, {:institute => valid_attributes}, valid_session
#         }.to change(Institute, :count).by(1)
#       end

#       it "assigns a newly created institute as @institute" do
#         post :create, {:institute => valid_attributes}, valid_session
#         assigns(:institute).should be_a(Institute)
#         assigns(:institute).should be_persisted
#       end

#       it "redirects to the created institute" do
#         post :create, {:institute => valid_attributes}, valid_session
#         response.should redirect_to(Institute.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved institute as @institute" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Institute.any_instance.stub(:save).and_return(false)
#         post :create, {:institute => { "name" => "invalid value" }}, valid_session
#         assigns(:institute).should be_a_new(Institute)
#       end

#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Institute.any_instance.stub(:save).and_return(false)
#         post :create, {:institute => { "name" => "invalid value" }}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested institute" do
#         institute = Institute.create! valid_attributes
#         # Assuming there are no other institutes in the database, this
#         # specifies that the Institute created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         Institute.any_instance.should_receive(:update).with({ "name" => "MyString" })
#         put :update, {:id => institute.to_param, :institute => { "name" => "MyString" }}, valid_session
#       end

#       it "assigns the requested institute as @institute" do
#         institute = Institute.create! valid_attributes
#         put :update, {:id => institute.to_param, :institute => valid_attributes}, valid_session
#         assigns(:institute).should eq(institute)
#       end

#       it "redirects to the institute" do
#         institute = Institute.create! valid_attributes
#         put :update, {:id => institute.to_param, :institute => valid_attributes}, valid_session
#         response.should redirect_to(institute)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the institute as @institute" do
#         institute = Institute.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Institute.any_instance.stub(:save).and_return(false)
#         put :update, {:id => institute.to_param, :institute => { "name" => "invalid value" }}, valid_session
#         assigns(:institute).should eq(institute)
#       end

#       it "re-renders the 'edit' template" do
#         institute = Institute.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Institute.any_instance.stub(:save).and_return(false)
#         put :update, {:id => institute.to_param, :institute => { "name" => "invalid value" }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested institute" do
#       institute = Institute.create! valid_attributes
#       expect {
#         delete :destroy, {:id => institute.to_param}, valid_session
#       }.to change(Institute, :count).by(-1)
#     end

#     it "redirects to the institutes list" do
#       institute = Institute.create! valid_attributes
#       delete :destroy, {:id => institute.to_param}, valid_session
#       response.should redirect_to(institutes_url)
#     end
#   end

# end
