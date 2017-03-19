class AddCategoryIdToWorkingList < ActiveRecord::Migration[5.0]
  def change
    add_column :working_lists, :category_id, :integer
  end
end
