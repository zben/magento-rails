class ProductsController < ApplicationController

  def index
    
    if params[:category_id]
      @category = Category.find(params[:category_id].to_i)
      @products = @category.products
      @products = Kaminari.paginate_array(@products).page(params[:page]).per(10)
    else
      @products = Product.all.page(params[:page]).per(10)
    end
  end
   
  def show
    @product = Product.find(params[:id].to_i)
  end

  def search
  end
  
  def populate 
    eval(params[:class_name].capitalize).populate
    redirect_to :back
  end
end
