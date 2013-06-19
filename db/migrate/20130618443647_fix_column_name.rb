class FixColumnName < ActiveRecord::Migration
  def up
  	add_column(:suppliers, :email, :string)
  	add_column(:suppliers, :zip, :integer)
  end

  def down
  end
end
