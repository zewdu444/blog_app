class User < ApplicationRecord
  has_many :posts ,dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def  most_recent_post(first_name)
    user =find_by(first_name)
    user.posts.order(created_at: :desc).limit(3)
  end
end

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
