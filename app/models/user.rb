class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :payments, as: :payee

  scope :paid_game, ->(game) { payments.where.in(game.payments) }
  
  def self.from_omniauth(auth)
    if where(provider: nil, uid: nil, email: auth.info.email).present?
      # convert guest users into actual users
      user = find_by(email: auth.info.email).update!(
        provider: auth.provider,
        uid: auth.uid,
        name: auth.info.name,
        oauth_token: auth.credentials.token,
        oauth_expires_at: Time.at(auth.credentials.expires_at)
      )
      user
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
