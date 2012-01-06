class ProductsController < ApplicationController
  
  
  
  def index

    if params[:category_id]
      @category = MagentoAPI.call 'category.info',:string=> params[:category_id]
      @products = get_product_list_by_category(@category)
      
    else
      @products = MagentoAPI.call 'product.list'
    end
    
   
  end
   
  def show
    @categories= MagentoAPI.xmlcall('category.tree')["children"][0]["children"]
    @product = MagentoAPI.call('product.info',:string=>params[:id])
    @image_path = MagentoAPI.call('product_media.list',:string=>params[:id])[0]["url"]
  end

  def search
  end
  
  def get_product_list_by_category(category)
      @products=[]
      if category['level']=="2" && !category['children'].nil? && category['children'].include?(',')
          category['children'].split(',').each do |subcat_id|
            @products+=MagentoAPI.call("category.assignedProducts",:string=>subcat_id)
          end
      else 
        @products = MagentoAPI.call "category.assignedProducts",:string=>category['category_id']  
      end
   
     @products = @products.map{|product| MagentoAPI.xmlcall('product.list',:product_id=>product["product_id"])[0]}
  end

  
  def get_categories

  end
  
  def get_product_info_by_id
  end
  
  def get_product_ids_by_category_id
  end
  

end
