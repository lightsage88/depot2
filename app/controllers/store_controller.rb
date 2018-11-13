class StoreController < ApplicationController
  include VisitCount
  include CurrentCart
  before_action :set_cart
  before_action :get_visit_count, only: [:index]
  def index
    @products = Product.order(:title)
    # puts session[:counter]
    @visit_counter = session[:counter]
  end
end
