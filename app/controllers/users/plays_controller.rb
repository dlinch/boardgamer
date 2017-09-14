class Users::PlaysController < ApplicationController

  def show
    @play = Play.find(params[:id])
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @plays = Play.joins(:users).where(users: {id: @user.id})
  end

end
