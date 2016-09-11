class AddCoverUrlToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :cover_url, :string
  end
end
