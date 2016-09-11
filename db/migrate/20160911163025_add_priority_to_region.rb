class AddPriorityToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :priority, :integer, null:false ,default: 0
  end
end
