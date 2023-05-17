class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_post_comment_counter
  after_destroy :decrement_post_comment_counter

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end

  def decrement_post_comment_counter
    post.decrement!(:comments_counter)
  end
  private :update_post_comment_counter, :decrement_post_comment_counter
end
