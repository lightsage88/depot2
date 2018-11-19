class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  def authorize
    puts "authorize running"
    puts session[:user_id]
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Nice try, login if you actually belong here."
    end
  end
  
end
