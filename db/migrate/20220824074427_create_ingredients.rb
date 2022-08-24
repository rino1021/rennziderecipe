class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.references :post_image, null: false, foreign_key: true
      t.string :ingredients
      t.timestamps
    end
  end
end
