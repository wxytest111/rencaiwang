class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.integer :priority, default: 0
      t.integer :status, null: false, default: 0
      t.attachment :cover

      t.timestamps null: false
    end
  end
end
