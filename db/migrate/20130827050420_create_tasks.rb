class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :priority
      t.datetime :deadline
      t.integer :todo_list_id

      t.timestamps
    end
  end
end
