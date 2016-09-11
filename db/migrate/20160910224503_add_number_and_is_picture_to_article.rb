class AddNumberAndIsPictureToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :number, :integer, null: false, default: 0
    add_column :articles, :is_picture, :integer, null: false, default: 0
  end
end
