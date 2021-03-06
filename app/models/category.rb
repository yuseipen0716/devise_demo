class Category < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :articles, through: :categorizations
  validates :name, length: { maximum: 50 }, presence: true
end
