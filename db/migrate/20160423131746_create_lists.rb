class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :category_id
      t.text :memo
      t.integer :user_id
      t.integer :sum

      t.timestamps null: false
    end
  end
end
