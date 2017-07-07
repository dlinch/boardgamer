class UsersController < ApplicationController
  def create
     if user = User.create(params.require(:user).permit(:first_name, :last_name))
       redirect_to user_path(user.id)
     end
  end

  def update
    if user = User.update(params.require(:user).permit(:first_name, :last_name))
      redirect_to user_path(user.first.id)
    end
  end

  def new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    if user = User.find_by(id: params[:id]).destroy
      redirect_to root
    end
  end

  def index
    @users = User.all
  end

end
