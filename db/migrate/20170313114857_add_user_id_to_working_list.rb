class AddUserIdToWorkingList < ActiveRecord::Migration[5.0]
  def change
    add_column :working_lists, :user_id, :integer
  end
end
