class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :check_admin_user, only: [:new, :edit, :update, :destroy]
  before_action :check_user

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

  def check_admin_user
    redirect_to root_url, alert: "Sorry, you do not have the necessary clearance to view this page" unless administrator
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :game_date, :cost, :team)
  end
end
