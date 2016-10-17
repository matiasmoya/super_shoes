class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :total_in_shelf, default: 0
      t.integer :total_in_vault, default: 0
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
