class UsersController < ApplicationController
  def create
  end

  def update
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
  end

  def index
    @users = User.all
  end

end
