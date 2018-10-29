class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :payments, as: :payee

  scope :paid_game, ->(game) { payments.where.in(game.payments) }#joins(:payments).where(payments.game_id = game.id AND IN payments }

  def self.from_omniauth(auth)
    if where(provider: nil, uid: nil, email: auth.info.email).present?
      # convert guest users into actual users
      find_by(email: auth.info.email).first.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.update!
      end
    else
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        # TODO: include Google image here (auth.info.image)
        user.save!
      end
    end
  end

  def paid?(payments)
    payments
  end
end
