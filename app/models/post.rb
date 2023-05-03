class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
