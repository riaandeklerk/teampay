class Payment < ApplicationRecord
  belongs_to :payee, class_name: 'User'
  
  has_and_belongs_to_many :players, class_name: 'User', join_table: 'payments_players'
  has_and_belongs_to_many :games

  scope :paid, -> { where(stripe_paid: true) }
end
