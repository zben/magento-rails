module ApplicationHelper
  def print_price(price_string)
    sprintf("$%05.2f",price_string.to_f)  
  end
end
