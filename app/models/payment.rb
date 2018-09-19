class Payment < ApplicationRecord
  belongs_to :payee, :class_name => "User"

  has_many :players
  has_many :games

  scope :paid, -> { where(stripe_paid: true) }
end
