class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      t.timestamps
      t.string :recipe_name
      t.text :caption
      t.string :ingredients
      t.integer :user_id
    end
  end
end
