class Post < ApplicationRecord

  belongs_to :user
  attachment :image  #_idは含めない。refileを使用するうえでのルール
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, length: { in: 1..20 }  #1字以上20字以内
  validates :image, presence: true
  validates :body, presence: true  #contentsのこと

  acts_as_taggable 
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?    #引数で渡されたユーザidがFavoritesテーブル内に存在(exists?)するかどうかを調べる
  end

end
