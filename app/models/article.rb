class Article < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  validates :title, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 100000 }, presence: true
end
