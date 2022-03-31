class CreateArticleCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :article_categories do |t|
      t.belongs_to :article
      t.belongs_to :category

      t.timestamps
    end
  end
end
