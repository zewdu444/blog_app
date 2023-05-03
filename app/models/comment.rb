class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, class_name: 'Post', counter_cache: :comments_counter

  def update_post_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
