class CreateWorkingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :working_lists do |t|
      t.date :date
      t.string :department
      t.string :colleague
      t.string :title
      t.boolean :is_plan, default: true
      t.float :take_time
      t.text :descrption
      t.string :progress
      t.timestamps
    end
  end
end
