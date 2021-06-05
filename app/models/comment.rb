class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  validates :comment, length: { in: 1..200 }

end
