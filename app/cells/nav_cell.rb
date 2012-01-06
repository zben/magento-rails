class NavCell < Cell::Rails

  include Devise::Controllers::Helpers
  helper_method :current_user 
  helper_method :user_signed_in? 
  cache :topnav, :expires_in => 10.minutes
  cache :leftnav, :expires_in => 10.minutes
  
  def topnav
    @categories= MagentoAPI.xmlcall('category.tree')["children"][0]["children"]
    render
  end

  def leftnav
    @categories= MagentoAPI.xmlcall('category.tree')["children"][0]["children"]
    render
  end
end
