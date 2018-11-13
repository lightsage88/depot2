Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, on: :member
    end
  # get 'store/index'
root "store#index", as: "store_index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #A single entry in the routing file such as
    #resources :products
  #creates SEVEN (7) different routes in your application,
  #each mapping to the Products Controller:
=begin
Http-verb path          controller/action     used-for
GET      /products      products#index        display list of all products
GET      /products/new  products#new          return an HTML form for creating a new product
POST     /products      products#create       create a product
GET      /products/:id  products#show         display a specific product
GET      /products/:id/edit products#edit     return an HTML form for editing a product
PATCH/PUT /products/:id  products#update      update a specific product
DELETE    /products/:id products#destroy      delete a specific product


When you declare your resources in routes.rb like so:
resources :products
then you automatically have the following available paths:
products_path
product_path
new_product_path
edit_product_path
  

run `rake routes` to see how it all works.
=end

end
