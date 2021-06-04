class Post < ApplicationRecord
  
  belongs_to :user
  attachment :image  #_idは含めません。refileを使用するうえでのルール
  has_many :comments, dependent: :destroy
end
