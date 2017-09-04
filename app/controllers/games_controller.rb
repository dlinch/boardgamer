class GamesController < ApplicationController
  def new; end

  def create
    if game = Game.create(game_params)
      redirect_to game_path(game.id)
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    if game = Game.find(params[:id])
      game.update(game_params)
      redirect_to game_path(game)
    end
  end

  def destroy
    if game = Game.find(params[:id]).destroy
      redirect_to root_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
