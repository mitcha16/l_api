class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :job_title
      t.string :business_unit
      t.string :department
      t.string :location
      t.date   :hire_date
      t.string :manager_name
      t.timestamps
    end
  end
end
