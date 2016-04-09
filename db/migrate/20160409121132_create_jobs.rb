class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

      t.string :pay_day
      t.integer :pay_methods_id
      t.integer :wage
      t.integer :users_id
      t.integer :work_days
      t.integer :work_times		

      t.timestamps null: false
    end
  end
end
