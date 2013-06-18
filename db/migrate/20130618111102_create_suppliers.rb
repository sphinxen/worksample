class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phone
      t.string :cathegory
      t.string :address
      t.string :city
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
