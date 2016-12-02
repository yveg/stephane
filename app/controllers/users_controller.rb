class UsersController < ApplicationController
  #attr_accessible
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,  only: :destroy

  public
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user deleted"
    redirect_to users_url
  end

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def new
    @user =User.new
  end

  def  show
    @user = User.find(params[:id])
    @microposts =@user.microposts.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated?
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
      @user.send_activation_email
      #UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Vérifier vos emails pour activer votre compte."
      redirect_to root_url
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

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
