class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :assignees_count
      t.integer :completed_count
      t.references :course, index: true
      t.timestamps
    end
  end
end
