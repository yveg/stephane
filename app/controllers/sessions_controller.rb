class SessionsController < ApplicationController

  def new

  end

  def create
  user = User.find_by(email: params[:session][:email].downcase)
          if  user && user.authenticate(params[:session][:password])
          flash.now[:success]= "log reussi, bien authentifie"
          redirect_to user
           #render 'show'
          else
          flash.now[:danger]= "echec de connexion, veuillez reessayer"
          render 'new'
          end

  end

end
