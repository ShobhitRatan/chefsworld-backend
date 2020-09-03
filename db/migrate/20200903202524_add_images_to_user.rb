class AddImagesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image_1, :string
    add_column :users, :image_2, :string
  end
end
