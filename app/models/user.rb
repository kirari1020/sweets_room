class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #フォロー機能のアソシエーション
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :following

  attachment :profile_image

  validates :name, length: { in: 1..20 }, uniqueness: true
  validates :profile, length: {maximum: 100}


  def follow(user_id)
    relationships.create(following_id: user_id)
    return user = User.find(user_id)
    #24行目だけだとrelationshipsのデータだけを渡してしまうので、returnでユーザーのデータを渡してコントローラーに返す。
  end

  def unfollow(user_id)
    relationships.find_by(following_id: user_id).destroy
    return user = User.find(user_id)
  end

  def following?(user)
    followings.include?(user)
  end

  # [検索方法]　ユーザーの名前（部分一致）
  def self.search_for(content)
      User.where('name LIKE ?', '%' + content + '%')
  end

end
