class ProductsController < ApplicationController
  before_filter :require_user, :except => :index
  
  def index
   @products = Product.all
  end
  
  def new
    @product = Product.new
  end 
   
 
 def create
  @product = Product.new(params[:product])
  respond_to do |wants|
    if @product.save
      flash[:notice] = 'product was successfully created.'
      wants.html { redirect_to(@product) }
    else
      flash[:error] = "Could not add the product, check the form"
      wants.html { render :action => "new" }
    end
  end
 end
 
 def show
   @product = Product.find(params[:id])
 end
 
 def edit
  @product = Product.find(params[:id])
 end
 
 def update
  @product = Product.find(params[:id])
  if @product.update_attributes(params[:product])
    flash[:notice] = "Changes were saved"
    redirect_to product_path(@product)
  else
    flash[:notice] = "Changes were not saved"
    render  "edit"
  end
 end 
  
 def destroy
   @product = Product.find(params[:id])
   if @product.destroy
     flash[:notice] = "product removed"
     redirect_to products_url
   else 
     flash[:error] = "Could not remove the product"
     render "index"
   end
 end

end
