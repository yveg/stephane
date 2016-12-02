class ApplicationController < ActionController::Base
include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def  bonjour
    render html: "bonjour bienvenu sur le super serveur"
    end
end

def logged_in_user
  unless logged_in?
    store_location
    flash[:danger] = "please login"
    redirect_to login_url
  end
end
