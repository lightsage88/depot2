Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
   get 'login' => :new
   post 'login' => :create
   delete 'logout' => :destroy
  end


  resources :users
  resources :products do
    get :who_bought, on: :member
    end

    scope '(:locale)' do  
      resources :orders
      resources :line_items
      resources :carts
      root 'store#index', as: 'store_index', via: :all
    end
  end


# Depot2::Application.configure do
#   config.action_mailer.delivery_method = :smtp

#   config.action_mailer.smtp_settings = {
#     address: "smtp.gmail.com",
#     port: 587,
#     domain: "domain.of.sender.net",
#     authentication: "plain",
#     user_name: "dave",
#     password: "secret",
#     enable_starttls_auto: true
#   }
# end
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


