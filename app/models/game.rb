class Game < ApplicationRecord
  has_and_belongs_to_many :payments
  has_and_belongs_to_many :players, class_name: 'User', join_table: 'games_players'

  LEAGUE = ['MIXED','MENS']
  TEAM = ['Mighty Flux']

  def player_added?(player_id)
    players.include?(player_id)
  end
end
