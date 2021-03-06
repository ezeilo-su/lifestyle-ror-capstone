class Category < ApplicationRecord
  has_and_belongs_to_many :articles
  validates :priority, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  default_scope -> { order('priority') }
  scope :fetch, -> { preload(articles: [{ image_attachment: :blob }]) }

  def name_capitalize
    cap_name = []
    name.split(' ').each do |n|
      cap_name << n.capitalize
    end
    cap_name.join(' ')
  end
end
