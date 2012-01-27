## Project Background

This is an application that attempts to solve real problems at work. Magento is a popular PHP-based e-commerce platform with strong features. It allows flexible attributes set for products. However, a major downside of Magento is that it is difficult to customize the front-end, especially when you want to add new pages, morph components on different pages into one. It would involves a lot of XML declarations for even a simple modification.

Rails is great for front-end development because there is total decoupling of front-end and back-end. The idea of this project is to combine the best of both worlds, using Rails for front-end and feature additions and use Magento for product relation store and order processing and management.

**demo site:** http://magentorails.heroku.com

## Keywords
Rails 3.1, MongoDB/MongoID, Omniauth, Magento API, Twitter Bootstrap
  
## Objectives achieved
1. Allows Omniauth sign-in which is a breeze in Rails and would be difficult in Magento. When a user first sign in, a Magento user will be created through Magento SOAP API. All activity of omniauth user can be mapped to the Magento user.

2. Used MongoDB for product/category data. Ideally it would work to use MongoDB for all of the data. But I wanted to demonstrate that MongoID allows user to interact with SQL data without a problem through model methods. MongoDB for product data is espeically great because lack of schema allows you to have very flexible product model for different product types.

3. Wrote a Magento API adaptor(models/magento_api.rb) that would enable the controllers to retrieve different types of data easily. Both XMLRPC API and SOAP API are used because they each expose certain types of data in a more useful manner.

4. Manual synchronization of product data. As of now, a sync product button is on the page to allows re-building of product and category data which takes about 5 minutes. Calling API to get all product information needed to render a page is impractical because Magento API is slow and some information can only be retrieved after 2 or 3 API calls.

5. Added multiple wishlist feature, which is not supported by Magento natively. 

6. Allows Rails site on Heroku talk successfuly with a remotely hosted Magento test store through API. This means I don't need to run a local instance of Magento to make this proof of concept. 


## Areas for improvements
1. Because Magento API does not conform to SOAP standards entirely, certain API calls cannot be made successfully with the correct arguments passed. Therefore order placement cannot be currently done. More tweaking needs to be done to make Magento API fully usable.

2. Instead of doing a nightly update of product data. We could implementa mutual push system. When there is a change in Magento product data, Magento should send out a API request to update that data on the Rails site and vice versa. This is equivalent to granular caching where any granular change will propagate itself, making a full resync unnecessary.
 
3. More social commerce could be added. For example, can can potentially see what his facebook friends have purchased in this store and therefore he might be more inclined to make a purchase. This might require some good design that reduces the search time. But in straight Magento, such features are usually out of quesiton.


