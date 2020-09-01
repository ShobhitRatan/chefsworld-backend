class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :label 
      t.integer :user_id 
      t.string :meal 
      t.string :dish 
      t.string :cuisine 
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
