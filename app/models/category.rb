class Category < ApplicationRecord
  has_and_belongs_to_many :articles, dependent: :destroy
  default_scope -> { order(priority) }
  validates :priority, presence: true
  validates :name, presence: true, length: { maximum: 15 }
end