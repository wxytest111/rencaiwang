class AddStatusToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :status, :integer, null:false, default:0
  end
end
