class AddParentToCateogry < ActiveRecord::Migration
  def change
    add_column :categories, :parent_id, :integer, null:true
  end
end
