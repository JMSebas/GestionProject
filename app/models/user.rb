class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  
         validates :name, presence: true
         validates :lastname, presence: true
         validates :address, presence: true
         validates :phone, presence: true
         validates :birthdate, presence: true
         validates :username, presence: true
         validates :email, presence: true, uniqueness: true
         validates :password, presence: true, length: { minimum: 6 }

  def jwt_payload
    super
  end

end
