class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :check_admin_user, only: [:new, :edit, :update, :destroy]
  before_action :check_user

  def index
    @games = Game.all.order('game_date DESC')
    @total = payment_amount
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

  def add_game_player_payment
    player = params[:player]
    game = params[:game]
    cart = session[:cart] || {}
    if cart.present?
      if cart.has_key?(game)
        cart[game] << player
      else
        cart[game] = [player]
      end
    else
      cart[game] = [player]
    end
    session[:cart] = cart
    redirect_back(fallback_location: game) 
  end

  def add_player
    @game = Game.find(params[:game_id])
    @game.players << User.where(id: params[:player])
    if @game.save!
      redirect_back(fallback_location: @game) 
    else
      #ohh deer
    end
  end

  def remove_player
    @game = Game.find(params[:game_id])
    if @game.players.delete(User.find(params[:player]))
      redirect_back(fallback_location: @game) 
    else
      #ohh nooo!
    end
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
      #chips!
    end
  end

  private

  def payment_amount
    #byebug
    if session.has_key?(:total) || session.has_key?(:cart)
      calculate_balance
    else
      0 #need curency here
    end
    #session[:total] || 0
  end

  def calculate_balance
    total = 0
    session[:cart].each do |game, players|
      total = total + (Game.find(game).player_fee * players.count)
      #total = total + (Game.find(game).cost) * players.count
    end
    session[:total] = (total * 100).to_d
  end

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
