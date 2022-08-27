class AddColumnNames < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :name, :string
  end
end
