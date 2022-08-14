class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      #t.integer :user_id
      #t.integer :post_image_id
      t.references :user, null: false, foreign_key: true
      t.references :post_image, null: false, foreign_key: true
      t.timestamps
    end
  end
end
