class PlaysController < ApplicationController
  def new; end

  def create
    if play = Play.create!(play_params)
      redirect_to play_path(play.id)
    end
  end

  def show
    @play = Play.find(params[:id])
  end

  def index
    @plays = Play.all
  end

  def edit
    @play = Play.find(params[:id])
  end

  def update
    if play = Play.find(params[:id])
      play.update(play_params)
      redirect_to play_path(play)
    end
  end

  def destroy
    if play = Play.find(params[:id]).destroy
      redirect_to root_path
    end
  end

  private

  def play_params
    params.require(:play).permit(:winner_id, :users, :game_id)
  end
end
