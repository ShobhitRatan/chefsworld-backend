class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :label 
      t.integer :cuisine_id 
      t.integer :meal_id 
      t.integer :dish_id 
      t.string  :ingredients 
      t.string :image_url 
      t.string :source 
      t.string :source_url 
      t.string :diet_labels 
      t.string :health_labels 
      t.string :cautions 
      t.timestamps
    end
  end
end
