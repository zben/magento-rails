class Product
  include ApplicationHelper
  include Mongoid::Document
  field :price, type: Float
  field :sku, type: String
  field :name, type: String
  field :image_url, type: String
  field :small_image_url, type: String
  field :thumbnail_url, type: String
  field :short_description, type: String
  field :long_description, type: String
  field :visibility, type: Integer
  has_and_belongs_to_many :categories
  scope :visible, where(:visibility.in=>[2,4])
  
  def self.populate
    products = MagentoAPI.xmlcall('product.list')
    products.each do |product|
      puts product_id = product['product_id'].to_i
      category_ids = product['category_ids'].map{|x| x.to_i}
      
      product_info = MagentoAPI.call 'product.info',:string=>product_id
      image = MagentoAPI.call 'product_media.list',:string=>product_id
      image.each do |hash|
        name = hash['types'][:item]
        if name.is_a? Array
          name.each do |sub_name|
            instance_variable_set "@#{sub_name}_url", hash['url']  
          end 
        else
          instance_variable_set "@#{name}_url", hash['url']  
        end
      end
      x= Product.find_or_create_by(:id => product_id)
      x.update_attributes(
        :price => product_info['price'],
        :sku => product['sku'],
        :name => product['name'],
        :short_description => product_info['short_description'],
        :long_description => product_info['description'],
        :image_url => @image_url,
        :thumbnail_url => @thumbnail_url,
        :small_image_url => @small_image_url,
        :visibility=> product_info['visibility'].to_i,
        :category_ids => category_ids
      )  
      x.categories.map{|cat| cat.products << x}
    end
  end
  
  def pprice
    print_price(price)
  end
  
  def category
    categories[0]
  end
  
  def root_category
    categories[0].root_parent
  end
  
end

