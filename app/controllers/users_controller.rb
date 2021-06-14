class UsersController < ApplicationController
  before_action :correct_user,only: [:edit]  #URLの直打ち禁止

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def correct_user   #URLの直打ち禁止
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end

end
