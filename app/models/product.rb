class Product
  include ApplicationHelper
  
  attr_accessor :product, :price, :sku, :name, :image_url, :short_description, :long_description
  
  def initialize(product_id)
    @product = MagentoAPI.call 'product.info',:string=>product_id
    @price = print_price(@product['price'])
    @sku = @product['sku']
    @name = @product['name']
    @image_url = MagentoAPI.call('product_media.list',:string=>product_id)[0]["url"]
    @short_description = @product['short_description']
    @long_description = @product['description']
     
  end
  
  
end
