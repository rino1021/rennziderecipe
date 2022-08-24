class CreateCaptions < ActiveRecord::Migration[6.1]
  def change
    create_table :captions do |t|
      t.references :post_image, null: false, foreign_key: true
      t.text :caption
      t.timestamps
    end
  end
end
