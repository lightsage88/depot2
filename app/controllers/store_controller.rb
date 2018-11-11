class StoreController < ApplicationController
  include VisitCount
  before_action :get_visit_count, only: [:index]
  def index
    @products = Product.order(:title)
    puts session[:counter]
  end
end
