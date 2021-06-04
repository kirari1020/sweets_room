class Post < ApplicationRecord
  
  belongs_to :user
  attachment :image  #_idは含めない。refileを使用するうえでのルール
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)   
    favorites.where(user_id: user.id).exists?    #引数で渡されたユーザidがFavoritesテーブル内に存在(exists?)するかどうかを調べる
  end
  
end
