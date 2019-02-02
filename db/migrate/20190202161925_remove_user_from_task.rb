class RemoveUserFromTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :user, :reference
  end
end
