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

  def players
    @game = Game.find(params[:game_id])
    @players = User.all.select(&:name)
  end

  def add_player #_to_game
    @game = Game.find(params[:game_id])
    @game.players << User.where(id: params[:player])
    if @game.save!
      redirect_back(fallback_location: @game) 
      #redirect_to(:back)
      #redirect_to 
    else
    end
  end

  def remove_player #_to_game
    @game = Game.find(params[:game_id])
    if @game.players.delete(User.find(params[:player]))
      redirect_back(fallback_location: @game) 
    else
    end
    #@game.save!
  end

  def new_player
    game = Game.find(params[:game_id])
    @player = game.players.new
  end

  def save_new_player
    game = Game.find(params[:game_id])
    @player = game.players.new(player_params)

    if @player.save
      game.save!
      redirect_to game_players_path
    else
      #render action: 'new'
    end
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

  def player_params
    params.require(:user).permit(:name, :email)
  end
end
