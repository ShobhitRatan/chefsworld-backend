class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :description
      t.integer :user_id
      t.string :entry_date
      t.string :end_date
      t.string :enrollment_status

      t.timestamps
    end
  end
end
