class RenameIngredientsColumnToPostImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_images, :ingredients, :ingredient
  end
end
