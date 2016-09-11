class AddOnLeftToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :on_left, :integer, null:false, default: 0
  end
end
