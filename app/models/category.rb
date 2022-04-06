class Category < ApplicationRecord
  has_many :categorizations
  validates :name, length: { maximum: 50 }, presence: true
end
