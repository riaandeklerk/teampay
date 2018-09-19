class Game < ApplicationRecord
  has_many :payments
  has_many :players

  TEAM = ['MIXED','MENS']
end
