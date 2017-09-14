class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   if user = User.create(user_params)
     redirect_to user_path(user.id)
   end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    if user = User.find_by(id: params[:id])
      user.update(user_params)
      redirect_to user_path(user.id)
    end
  end

  def destroy
    if user = User.find_by(id: params[:id]).destroy
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
