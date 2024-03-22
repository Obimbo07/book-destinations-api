class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
   :jwt_authenticatable, jwt_revocation_strategy: self

    has_many :reservations

    validates :username, :email, presence: true

    def self.signin_or_create_from_provider(provider_data)
      where(provider: provider_data[:provider], uid: provider_data[:uid]).first_or_create do |user|
        user.email = provider_data[:info][:email]
        user.password = Devise.friendly_token[0, 20]
      end
    end
end
