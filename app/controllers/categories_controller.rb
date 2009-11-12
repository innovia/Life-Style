class CategoriesController <  ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        
        if params[:services_page]
          redirect_to services_path
        else
        redirect_to categories_path
        end
      
      else
        flash[:error] = "something went wrong"
        render :action => "new" 
      end 
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update_attribute("name", params[:category][:name])
    if @category.save
      flash[:notice] = "Changes were saved"
      redirect_to categories_path
    else
      flash[:error] = "something went wrong"
      render "edit"
    end
    
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "category removed"
      redirect_to categories_url
    else 
      flash[:error] = "Could not remove the category"
      render "index"
    end
  end
end
