class Users::GamesController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    @game = Game.find(params[:id])
  end

  def index
    @user = User.find_by(id: params[:user_id])
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
