class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_user_post_counter
    author.update(posts_counter: author.posts.count)
  end
  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

end
