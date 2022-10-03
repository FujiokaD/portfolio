class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :text
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
