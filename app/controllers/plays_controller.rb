class PlaysController < ApplicationController
  def new
    @play = Play.new
  end

  def create
    byebug
    if play = Play.create(play_params)
      redirect_to play_path(play.id)
    else
      @play = play
      render :new
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
      if play.update(play_params)
        redirect_to play_path(play)
      else
        @play = play
        render :edit
      end
    end
  end

  def destroy
    if play = Play.find(params[:id]).destroy
      redirect_to root_path
    end
  end

  private

  def play_params
    params.require(:play).permit(
    :winner_id,
    :game_id,
    user_ids: []
    )
  end
end
