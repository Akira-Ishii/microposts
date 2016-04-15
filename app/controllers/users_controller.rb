class UsersController < ApplicationController
 
  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(10)
   @following_users = @user.following_users.all
   @follower_users = @user.follower_users.all
   
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  before_action :authenticate_user, only: [:edit, :update]
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        render 'edit'
      end
  end
  
  def followings
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(10)
   @following_users = @user.following_users.all
   @follower_users = @user.follower_users.all
  end
  
  def followers
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(10)
   @following_users = @user.following_users.all
   @follower_users = @user.follower_users.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :body, :age, :area)
  end  

  def authenticate_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to login_path
    end
  end



end