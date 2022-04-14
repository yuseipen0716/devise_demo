require 'rails_helper'

RSpec.describe Article, type: :model do
  # タイトルと本文があれば有効な状態であること
  it "is valid with a title, body" do
    article = FactoryBot.build(:article)
    expect(article).to be_valid
  end

  # タイトルがなければ無効な状態であること
  it "is invalid without a title" do
    article = Article.new(title: nil)
    article.valid?
    expect(article.errors[:title]).to include("を入力してください")
  end

  # 本文がなければ無効な状態であること(bodyにvalidationかかっていないので、たぶんテストパスできない)
  it "is invalid without a body" do
    article = Article.new(body: nil)
    article.valid?
    expect(article.errors[:body]).to include("を入力してください")
  end

  # タイトルの文字数制限は100字なので、100文字のタイトルは有効であること
  it "is valid with 100-character title" do
    article = Article.new(title: "#{'a' * 100}", body: "test content")
    expect(article).to be_valid
  end

  # タイトルが101文字であるならバリデーションエラーが起きること
  it "is invalid with 101-character title" do
    article = Article.new(title: "#{'a' * 101}")
    article.valid?
    expect(article.errors[:title]).to include("は100文字以内で入力してください")
  end

  # 本文が10万文字なら有効な状態であること
  it "is valid with 100000-character text in body" do
    article = Article.new(title: "test title", body: "a" * 100000)
    expect(article).to be_valid
  end

  # 本文が10万文字より多い場合(100001文字）の場合、バリデーションエラーが起こること
  it "is invalid with 100001-character text in body" do
    article = Article.new(title: "test title", body: "a" * 100001)
    article.valid?
    expect(article.errors[:body]).to include("は100000文字以内で入力してください")
  end
end
