class User < ApplicationRecord
  validates :name, :email, presence: true

  belongs_to :customer

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      customer = Customer.find_or_create_by(
        email: auth.info.email,
        name: auth.info.name
      )
      user.customer = customer
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
