class SuppliersController < ApplicationController
  def index
  	
  	if params[:category] && params[:category] != ""
  		@suppliers = Supplier.where(:category => params[:category])
  	else
  		@suppliers = Supplier.all
  	end

  	@title = "home" 
  	@categorys = Supplier.group('category')
  	@category = params[:category]
  	@json = @suppliers.to_gmaps4rails do |supplier, marker|
  		marker.infowindow render_to_string(:partial => "/suppliers/infowindow", :locals => { :supplier => supplier})
	    marker.title "#{supplier.city}"
	    marker.json({ :category => supplier.category})
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
