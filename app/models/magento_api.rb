class MagentoAPI


      @@soap_client = Savon::Client.new do
        wsdl.document = "http://mrails.gostorego.com/index.php/api/?wsdl"
      end
     
      response = @@soap_client.request :login do
        soap.body = { :username => API_USER, :apiKey => API_KEY }
      end
     
      @@soap_session =  response[:login_response][:login_return];

  
  def self.restart
       @@soap_client = Savon::Client.new do
        wsdl.document = "http://mrails.gostorego.com/index.php/api/?wsdl"
      end
     
      response = @@soap_client.request :login do
        soap.body = { :username => API_USER, :apiKey => API_KEY }
      end
     
      @@soap_session =  response[:login_response][:login_return];

  end
  
  def self.xmlcall method, options={}
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

  

  
  def self.call method, options={}
    
    response = @@soap_client.request :call do
        if options.empty?
          soap.body = {:session => @@soap_session,:method => method}
        elsif options[:string]
          soap.body = {:session => @@soap_session,:method => method, :arguments=>[options[:string]]}
        else
          puts options
          soap.body = {:session => @@soap_session,:method => method, :arguments=>options}
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
  
  def self.multicall method, options={}
   
    response = @@soap_client.request :multicall do
        if options.empty?
          soap.body = {:session => @@soap_session,:method => method}
        elsif options[:string]
          soap.body = {:session => @@soap_session,:method => method, :arguments=>[options[:string]]}
        else
          soap.body = {:session => @@soap_session,:method => method, :arguments=>options}
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
