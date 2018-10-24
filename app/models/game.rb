class Game < ApplicationRecord
  validates :cost, presence: true

  has_and_belongs_to_many :payments
  has_and_belongs_to_many :players, class_name: 'User', join_table: 'games_players'

  scope :paid_players, -> { where(stripe_paid: true) }

  LEAGUE = ['MIXED','MENS']
  TEAM = ['Mighty Flux']

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
end
