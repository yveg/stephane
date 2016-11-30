class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if  user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      if params[:session][:remember_me] =='1'
        remember(user)
      else
        forget(user)
        end
      flash.now[:success]= "log reussi, bien authentifie"
      redirect_to user
      #render 'show'
    else
      flash.now[:danger]= "echec de connexion, veuillez reessayer"
      render 'new'
    end

  end

  def  destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
