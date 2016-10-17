class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :total_in_shelf
      t.string :total_in_vault
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
