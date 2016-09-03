class CreateUserRegions < ActiveRecord::Migration
  def change
    create_table :user_regions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
