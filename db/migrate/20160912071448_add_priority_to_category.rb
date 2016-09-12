class AddPriorityToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :priority, :integer, null:false, default:0
  end
end
