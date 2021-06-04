class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :profile, length: { in: 1..100 }
  validates :profile_image, presence: true
  validates :name, length: { in: 1..20 }, uniqueness: true

end
