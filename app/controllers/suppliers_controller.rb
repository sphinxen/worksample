class SuppliersController < ApplicationController
  def index
  	if params[:id]
  		@suppliers = Supplier.where(:id => params[:id])
  	else
  		@suppliers = Supplier.all
  	end

  	@title = "home" 
  	
  	@json = @suppliers.to_gmaps4rails do |supplier, marker|
  		marker.infowindow render_to_string(:partial => "/suppliers/infowindow", :locals => { :supplier => supplier})
	    marker.title "#{supplier.city}"
	    marker.json({ :cathegory => supplier.cathegory})
	    # marker.picture({#:picture => "http://mapicons.nicolasmollet.com/     wp-content/uploads/mapicons/shape-default/color-3875d7/shapeco     lor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshad     owstyle-dark/gradient-iphone/information.png",
	    #                 :width => 32,
	    #                 :height => 32})
	  end

  end

  def create
  	Supplier.create params[:supplier]

  	redirect_to suppliers_path
  end
end
