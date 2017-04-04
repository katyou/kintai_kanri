class CreateWorkTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :work_times do |t|
      t.integer :start_time
      t.integer :finish_time
      t.integer :work_time
      t.integer :rest_time

      t.timestamps
    end
  end
end
