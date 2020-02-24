class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
