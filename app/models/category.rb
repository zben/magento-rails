class Category
  include Mongoid::Document
  field :level, type: Integer
  field :name, type: String
  field :is_active, type: Boolean

  has_and_belongs_to_many :products
  has_many :children, :class_name=>"Category",  :inverse_of=>:parent
  belongs_to :parent, :class_name=>"Category",  :inverse_of=>:children
  
  def self.populate
    Category.all.delete
    categories = MagentoAPI.xmlcall('category.tree')["children"][0]["children"]
    categories.each{|x| add_record(x,nil)}
  end
  
  def self.add_record(category, parent)
    x= Category.create(:id=>category['category_id'].to_i,:level=>category['level'],:name=>category['name'],:is_active=>category['is_active']) 
    x.parent = parent
    x.save
    children = category['children']
    if !children.empty?
      children.each do |child|
        add_record(child,x)
      end
    end
  end
  
  alias :old_products :products
  
  def products
    if level == 2
     return [old_products,children.map{|child| child.products}].flatten
    else
      old_products
    end 
  end
  
  def flatten
    
  end
end

