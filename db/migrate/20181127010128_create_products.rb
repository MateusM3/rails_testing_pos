class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.references :shopping_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
