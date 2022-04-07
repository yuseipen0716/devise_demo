class Article < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  validates :title, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 100000 }, presence: true

  # 月別に記事を集計
  #def self.aggregate_monthly
  #  articles = Article.all
  #  archives = articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
  #end
end
