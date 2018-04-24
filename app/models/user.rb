class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  belongs_to :company, optional: true

  validates :first_name, :last_name, presence: true
  validates :company_name, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.company_name = 'testco123'
      user.password = Devise.friendly_token[0,20]
      user.save!
      # NEED TO REFACTOR THIS...IT'S INCREMENTING COMPANY_ID ON EACH SIGN IN
      user.create_company_after_registration(user)
    end
  end

  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

  #   # Uncomment the section below if you want users to be created if they don't exist
  #   unless user
  #     user = User.create(name: data['name'],
  #       email: data['email'],
  #       password: Devise.friendly_token[0,20]
  #     )
  #   end
  #   user
  # end

  def create_company_after_registration(user)
    company_name = user.company_name
    company = Company.create(name: company_name)
    if company.save
      user.update(company_id: company.id)
    else
      flash.now[:alert] = "A problem occurred during registration, please contact Nimble."
    end
  end
end
