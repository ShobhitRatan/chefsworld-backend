class CreateAwards < ActiveRecord::Migration[6.0]
  def change
    create_table :awards do |t|
      t.string :description
      t.integer :user_id
      t.string :received_date

      t.timestamps
    end
  end
end
