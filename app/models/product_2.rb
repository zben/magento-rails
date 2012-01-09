class Product
  include ApplicationHelper
  
  attr_accessor :product, :price, :sku, :name, :image_url, :small_image_url,:thumbnail_url, :short_description, :long_description
  
  def initialize(product_id)
    @product = MagentoAPI.call 'product.info',:string=>product_id
    @price = print_price(@product['price'])
    @sku = @product['sku']
    @name = @product['name']
    image = MagentoAPI.call('product_media.list',:string=>product_id)
    image.each do |hash|
      name = hash['types'][:item]
      if name.is_a? Array
        @image_url=hash['url'] 
        @thumbnail_url=hash['url'] 
        @small_image_url=hash['url']
        break 
      end
      instance_variable_set "@#{name}_url", hash['url']  
    end
    
    @short_description = @product['short_description']
    @long_description = @product['description']
     
  end
  
  
end
