require "test_helper"

class SuppliersControllerTest < ActionController::TestCase
	before do
    @supplier = Supplier.create :name => 'ICA', :phone => '555-687 558', :category => 'milk', :address => 'Fogdevagen 7a', :city => 'Karlskrona', :email => 'email@email.com'
  end

   it "should get index" do
     get :index
     assert_response :success
     assert_nil assigns(:posts)
   end

   it "should get new" do
     get :new
     assert_response :success
     assert_nil assigns(:category)
   end

   it "should get edit" do
     get :edit, {'id' => @supplier.id}
     assert_response :success
     assert_nil assigns(:posts)
   end
end
