class CreateTaskTags < ActiveRecord::Migration[5.1]
  def change
    create_table :task_tags do |t|
      t.integer :task_id
      t.string :tag

      t.timestamps
    end
  end
end
