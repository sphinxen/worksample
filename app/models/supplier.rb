class Supplier < ActiveRecord::Base
  acts_as_gmappable
  def gmaps4rails_address
  "#{address}, #{city}"
  end
  attr_accessible :address, :cathegory, :city, :latitude, :longitude, :name, :phone
end
