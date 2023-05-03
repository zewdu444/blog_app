class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, class_name: 'Post', counter_cache: :comments_counter
end
