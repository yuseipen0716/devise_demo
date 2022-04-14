class Article < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :comments, dependent: :destroy

  has_rich_text :body

  validates :title, length: { maximum: 100 }, presence: true
  validates :body, presence: true

  # ActionTextを利用しており、文字数が従来とずれるためカスタムバリデーションを作成
  validate :count_as_plaintext

  private

  def count_as_plaintext
    if body.to_plain_text.gsub(/\n/,"").length > 100000
      errors.add(:body, 'は100000文字以内で入力してください')
    end
  end

  # 月別に記事を集計
  #def self.aggregate_monthly
  #  articles = Article.all
  #  archives = articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
  #end
end
