class Relationships < ActiveRecord::Migration[5.1]
  def change
    create_table :user_assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :assignment, index: true
      t.string :status
      t.timestamps
    end
  end
end
