class CreateTasklists < ActiveRecord::Migration[5.1]
  def change
    create_table :tasklists do |t|
      t.string :name
      t.integer :project_id
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
