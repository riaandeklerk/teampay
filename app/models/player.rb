class Player < ApplicationRecord
    validates :name, :email, presence: true
  
    belongs_to :user

    has_many :games
    has_many :payments
end