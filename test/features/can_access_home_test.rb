require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  test "add supplier" do
  	@supplier = Supplier.create :name => 'ICA', :phone => '555-687 558', :cathegory => 'milk', :address => 'Fogdevagen 7a', :city => 'Karlskrona'
  	
    visit suppliers_path

    click_link 'Add Supplier'

    current_path.must_equal new_supplier_path

    fill_in 'Name', 	:with => "ICA"
    fill_in 'Phone', 	:with => '555-687 558'
    fill_in 'Cathegory',:with => 'milk'
    fill_in 'Address',	:with => 'Fogdev&auml;gen 7a'
    fill_in 'City',		:with => 'Karlskrona'
    click_button "Add Supplier"


    current_path.must_equal suppliers_path
    save_and_open_page
  end
end
