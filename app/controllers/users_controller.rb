class UsersController < ApplicationController
  def new; end

  def create
     if user = User.create(params.require(:user).permit(:first_name, :last_name))
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
    update_params = params.require(:user).permit(:first_name, :last_name)
    if user = User.find_by(id: params.id).update(params)
      redirect_to user_path(user.first.id)
    end
  end

  def destroy
    if user = User.find_by(id: params[:id]).destroy
      redirect_to root
    end
  end
end
