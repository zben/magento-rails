class NavCell < Cell::Rails

  include Devise::Controllers::Helpers
  helper_method :current_user 
  helper_method :user_signed_in? 
  
  def topnav opts
    @category = Category.find(params[:category_id].to_i).root_parent if params[:category_id]
    @category = opts[:item].root_category unless opts[:item].nil? 
    @categories= [1,3,0,2].map{|x| Category.where(:level=>2)[x]}
    render
  end

  def leftnav opts
    @category = Category.find(params[:category_id].to_i) if params[:category_id]
    @category = opts[:item].category unless opts[:item].nil? 
    @categories= [1,3,0,2].map{|x| Category.where(:level=>2)[x]}
    render
  end
end
