class CreateWorkExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :work_experiences do |t|
      t.integer :user_id
      t.string :chef_type
      t.string :experience
      t.string :employer_name
      t.string :start_date
      t.string :end_date
      t.string :current_workplace
      t.string :title
      t.string :description
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
