class Payment < ApplicationRecord
  belongs_to :game
  belongs_to :customer

  scope :paid, -> { where(stripe_paid: true) }
end
