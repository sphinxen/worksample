require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  test "sanity" do
  	@supplier = Supplier.create :name => 'ICA', :phone => '555-687 558', :cathegory => 'milk', :address => 'Fogdevagen 7a', :city => 'Karlskrona'
  	
    visit new_supplier_path

    # fill_in 'supplier', :with => "ICA"
    # fill_in 'phone', :with => '555-687 558'
    # click_button "Add Supplier"

    assert_have_content page, "ICA"
    refute_have_content page, "Goobye All!"
  end
end
