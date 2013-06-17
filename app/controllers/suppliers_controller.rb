class SuppliersController < ApplicationController
  def index
  	@suppliers = Supplier.all
  end

  def create
  	Supplier.create params[:supplier]

  	redirect_to :back
  end
end
