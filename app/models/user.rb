class User < ApplicationRecord
  has_many :posts , foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def most_three_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end

