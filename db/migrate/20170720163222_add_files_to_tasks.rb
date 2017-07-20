class AddFilesToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :files, :json
  end
end
