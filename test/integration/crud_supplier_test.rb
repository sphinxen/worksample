require "test_helper"

class CrudSupplierTest < ActionDispatch::IntegrationTest
  before do
    @supplier = Supplier.create :name => 'ICA', :phone => '555-687 558', :category => 'milk', :address => 'Fogdevagen 7a', :city => 'Karlskrona', :email => 'email@email.com'
  end

  it "add supplier" do
    visit suppliers_path

    click_link 'Add'

    current_path.must_equal new_supplier_path

    fill_in 'Name', 	:with => "ICA"
    fill_in 'Phone', 	:with => '555-687 558'
    fill_in 'Category',:with => 'milk'
    fill_in 'Address',:with => 'Fogdev&auml;gen 7a'
    fill_in 'City',		:with => 'Karlskrona'
    fill_in 'Email',  :with => 'email@email.com'
    click_button "Create Supplier"


    current_path.must_equal suppliers_path
    save_and_open_page
  end

  it "edit supplier" do
    visit edit_supplier_path(@supplier)

    find_field('Name').value.must_equal 'ICA'

    fill_in 'Category', :with => 'alcohol'
    click_button "Update Supplier"

    current_path.must_equal suppliers_path

    save_and_open_page

  end

  it "not update empy value" do
    visit edit_supplier_path(@supplier)

    fill_in 'Category', :with => ''

    click_button 'Update Supplier'

    current_path.must_equal edit_supplier_path(@supplier)
    page.must_have_content "There was an error updating the supplier"
  end

  it "should delete supplier" do
  	visit edit_supplier_path(@supplier)
  	click_link 'Delete Supplier'

  	page.must_have_content "Supplier successfully deleted"
  end
end
