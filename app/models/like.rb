class Like < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter
end
