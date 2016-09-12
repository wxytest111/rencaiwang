class AddIsRecommandToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :is_recommand, :integer, null:false, default: 0
  end
end
