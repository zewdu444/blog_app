class Post < ApplicationRecord
  belongs_to :users, counter_cache: true
  has_many :likes, :comments
end
