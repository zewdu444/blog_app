class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter

  def update_post_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
