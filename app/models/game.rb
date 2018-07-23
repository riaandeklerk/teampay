class Game < ApplicationRecord
  has_many :payments

  TEAM = ['MIXED','MENS']
end
