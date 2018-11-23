class Game < ApplicationRecord
  validates :cost, presence: true

  has_and_belongs_to_many :payments
  has_and_belongs_to_many :players, class_name: 'User', join_table: 'games_players'

  scope :paid_players, -> { where(stripe_paid: true) }
  scope :my_games, ->(user) { players.where.in(user) }


  LEAGUE = ['MIXED','MENS']
  TEAM = ['Mighty Flux']

  def my_game(user)
    user.in?(players)
  end

  def player_added?(player_id)
    players.map(&:id).include?(player_id)
  end

  def player_fee
    if players.present?
      cost / players.count
    else
      cost
    end
  end

  def outstanding_balance
    cost - (paid_players.count * player_fee)
  end

  def paid_players
    payments.map {|px| px.players.map(&:id)}.flatten.uniq
  end

  def paid_player?(player_id)
    paid_players.include?(player_id)
  end
end
