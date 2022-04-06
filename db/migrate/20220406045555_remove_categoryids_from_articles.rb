class RemoveCategoryidsFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :category_id, :integer
  end
end
