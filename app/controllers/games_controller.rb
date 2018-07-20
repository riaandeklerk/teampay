class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all.order('game_date DESC')
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    #TODO: @game.administrator_id = current_user.id
    #TODO: stripe stuff??

    if @game.save
      redirect_to @game
    else
      render action: 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :game_date, :cost, :team)
  end
end
