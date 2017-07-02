class UsersController < ApplicationController
  def create
     if user = User.create(params.require(:user).permit(:first_name, :last_name))
       redirect_to user_path(user.id)
     end
  end

  def update
  end

  def new
    # @user = User.new(params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
  end

  def index
    @users = User.all
  end

end
