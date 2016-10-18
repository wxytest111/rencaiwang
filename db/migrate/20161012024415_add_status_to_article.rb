class AddStatusToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :status, :integer, null:false, default: 0
  end
end
