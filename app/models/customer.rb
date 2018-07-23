class Customer < ApplicationRecord
  validates :name, :email, presence: true

  has_many :users
  has_many :payments
end
