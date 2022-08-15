class CreateRanks < ActiveRecord::Migration[6.1]
  def change
    create_table :ranks do |t|
      t.integer :post_image_id
      t.timestamps
    end
  end
end
