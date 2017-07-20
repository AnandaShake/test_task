class CreateUserAssigns < ActiveRecord::Migration[5.1]
  def change
    create_table :user_assigns do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
