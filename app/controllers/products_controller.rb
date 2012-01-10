class ProductsController < ApplicationController

  def index
    
    if params[:category_id]
      @category = Category.find(params[:category_id].to_i)
      @products = @category.products
      @products = Kaminari.paginate_array(@products).page(params[:page]).per(4)
    else
      @products = Product.all.visible.page(params[:page]).per(4)
    end
  end
   
  def show
    @product = Product.find(params[:id].to_i)
    @review = Review.new
  end

  def search
  end
  
  def populate 
    eval(params[:class_name].capitalize).populate
    redirect_to :back
  end
end
