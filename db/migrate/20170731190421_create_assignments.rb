class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.date :due_by
      t.date :assigned_at
      t.date :completed_at
      t.references :lesson, index: true
      t.integer :assignee_id
      t.timestamps
    end
  end
end
