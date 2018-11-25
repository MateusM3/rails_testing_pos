class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :title
      t.boolean :was_bought

      t.timestamps null: false
    end
  end
end
