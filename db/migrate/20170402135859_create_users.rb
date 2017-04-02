class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :mail, null: false
      t.string :password, null: false
      t.integer :status, null: false, default: 2
      t.boolean :present, default: 0

      t.timestamps
    end
  end
end
