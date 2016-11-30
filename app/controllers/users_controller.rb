class UsersController < ApplicationController
  #attr_accessible

  public
  def new
    @user =User.new
  end

  def  show
    @user = User.find(params[:id])
  end

  def create
    @user =User.new(user_params)
          if  @user.save
            flash[:success]= "Bienvenue parmi nous"
            log_in@user
            redirect_to@user
            #render 'show'
          else
            render 'new'
          end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
