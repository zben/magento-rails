class Review
  include ApplicationHelper
  include Mongoid::Document
  field :rating, type: Integer
  field :title, type: String
  field :content, type: String
  field :user_id, type: Integer
  field :product_id, type: Integer
  
  belongs_to :product
  
  def user
    User.find(user_id)
  end

end
