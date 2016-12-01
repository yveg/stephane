class UsersController < ApplicationController
  #attr_accessible
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]

  public
  def index
    #  @users=User.all
    @users= User.paginate(page: params[:page])
  end

  def new
    @user =User.new
  end

  def  show
    @user = User.find(params[:id])
  end

  def  update
    @user = User.find(params[:id])
    if  @user.update_attributes(user_params)
      flash[:success]="profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def  edit
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

  def correct_user
    @user=User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "please login"
      redirect_to login_url
    end
  end

end
