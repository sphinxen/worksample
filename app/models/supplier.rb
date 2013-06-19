class Supplier < ActiveRecord::Base
  acts_as_gmappable
  def gmaps4rails_address
  "#{address}, #{city}"
  end
  attr_accessible :address, :category, :city, :latitude, :longitude, :name, :phone, :email
end
