class Post < ApplicationRecord

  belongs_to :user
  attachment :image  #_idは含めない。refileを使用するうえでのルール
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, length: { in: 1..20 }  #1字以上20字以内
  validates :image, presence: true
  validates :body, presence: true  #contentsのこと

  acts_as_taggable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?    #引数で渡されたユーザidがFavoritesテーブル内に存在(exists?)するかどうかを調べる
  end

  	# [検索方法] 投稿のタイトルと内容（部分一致）
  def self.search_for(content)
      Post.where('title LIKE ? OR body LIKE ?', '%'+content+'%','%'+content+'%')
  end

end
