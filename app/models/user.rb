class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile
  has_one :preference
  has_one :vehicle
  has_many :path_offers
  has_many :feedback
  has_many :feedback_path
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
