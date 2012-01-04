class ProductsController < ApplicationController
  
  
  
  def index
    @categories= xmlcall('category.tree')["children"][0]["children"]
    if params[:category_id]
      @category = call 'category.info',:string=> params[:category_id]
      #@products = call "category.assignedProducts",:string=>params[:category_id]
      #@products = @products.map{|product| xmlcall('product.list',:product_id=>product["product_id"])[0]}
    else
      #@products = call 'product.list'
    end
    
   
  end
   
  def show
    @categories= xmlcall 'category.tree'
    @product = call('product.info',:string=>params[:id])
    @image_path = call('product_media.list',:string=>params[:id])[0]["url"]
  end

  def search
  end
  

  
  def get_categories

  end
  
  def get_product_info_by_id
  end
  
  def get_product_ids_by_category_id
  end
  
  def xmlcall method, options={}
    require 'xmlrpc/client'
    #@client = XMLRPC::Client.new("localhost","/magentosite/api/xmlrpc/",80)
    @client = XMLRPC::Client.new("mrails.gostorego.com","/api/xmlrpc/",80)
    session_id = @client.call('login',API_USER,API_KEY)
    unless options.empty?
      puts Array.wrap(options)
      @client.call('call',session_id,method,Array.wrap(options))
    else
      @client.call('call',session_id,method)
    end
  end

  
  
  def call method, options={}
    client = Savon::Client.new do
      wsdl.document = "http://mrails.gostorego.com/index.php/api/?wsdl"
    end
    response = client.request :login do
      soap.body = { :username => API_USER, :apiKey => API_KEY }
    end
    session =  response[:login_response][:login_return];
    response = client.request :call do
        if options.empty?
          soap.body = {:session => session,:method => method}
        elsif options[:string]
          soap.body = {:session => session,:method => method, :arguments=>[options[:string]]}
        else
          soap.body = {:session => session,:method => method, :arguments=>options}
        end
    end
    if response.success?
     # listing found products
      final=[]
      call_return = response[:call_response][:call_return]
      return [] if call_return[:item].nil?
      raw = call_return[:item]
      
      if raw.is_a? Hash #this is a list of one item
        final << raw[:item].inject({}){|x,y| x.merge(y[:key]=>y[:value])}
      else 
        if raw[0][:item].nil? #this is a product info
          return raw.inject({}){|x,y| x.merge(y[:key]=>y[:value])}
        else #this is a list of many items
          raw.each{|result| final << result[:item].inject({}){|x,y| x.merge(y[:key]=>y[:value])}}
        end
      end
      final
    end
    
  end
  
  def multicall method, options={}
    client = Savon::Client.new do
      wsdl.document = "http://mrails.gostorego.com/index.php/api/?wsdl"
    end
    response = client.request :login do
      soap.body = { :username => API_USER, :apiKey => API_KEY }
    end
    session =  response[:login_response][:login_return];
    response = client.request :multicall do
        if options.empty?
          soap.body = {:session => session,:method => method}
        elsif options[:string]
          soap.body = {:session => session,:method => method, :arguments=>[options[:string]]}
        else
          soap.body = {:session => session,:method => method, :arguments=>options}
        end
    end
    if response.success?
     # listing found products
      final=[]
      call_return = response[:call_response][:call_return]
      return [] if call_return[:item].nil?
      raw = call_return[:item]
      
      if raw.is_a? Hash #this is a list of one item
        final << raw[:item].inject({}){|x,y| x.merge(y[:key]=>y[:value])}
      else 
        if raw[0][:item].nil? #this is a product info
          return raw.inject({}){|x,y| x.merge(y[:key]=>y[:value])}
        else #this is a list of many items
          raw.each{|result| final << result[:item].inject({}){|x,y| x.merge(y[:key]=>y[:value])}}
        end
      end
      final
    end
    
  end
end
