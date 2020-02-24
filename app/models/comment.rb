class Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :post, counter_cache: true

  validates :name, presence: true
  validates :body, presence: true
end
