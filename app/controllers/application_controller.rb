class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  before_action :set_i18n_locale_from_params

  def authorize
    puts "authorize running"
    puts session[:user_id]
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Nice try, login should you actually belong here."
    end
  end

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        puts "Here is the locale: #{params[:locale]}"
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]

        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
  
end
