class ChangeTitleInTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :tittle, :string
    add_column :tasks, :title, :string
  end
end
