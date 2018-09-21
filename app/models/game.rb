class Game < ApplicationRecord
  has_and_belongs_to_many :payments
  has_and_belongs_to_many :players, class_name: 'User', join_table: 'games_players'

  TEAM = ['MIXED','MENS']
end
