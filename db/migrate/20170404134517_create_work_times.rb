class CreateWorkTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :work_times do |t|
      t.integer :start_time, null: false
      t.integer :finish_time, null: false
      t.integer :work_time
      t.integer :rest_time
      t.integer :user_id

      t.timestamps
    end
  end
end
