class User < ApplicationRecord
  has_many :participations
  has_many :companies, through: :participations, source: :pouss, source_type: 'Company'

  has_many :company_passages

  def pousses
    Participation.where("user_id = #{self.id}").includes([:pouss]).map(&:pouss)
  end

  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  geocoded_by :town
  after_validation :geocode, if: :will_save_change_to_town?

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(first_name: data["first_name"], last_name: data["last_name"], email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end

end
