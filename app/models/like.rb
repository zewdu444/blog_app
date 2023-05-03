class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter

  after_save :update_post_like_counter
  def update_post_like_counter
    post.increment!(:likes_counter)
  end
  private :update_post_like_counter
end
