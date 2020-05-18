class CreateTableItemOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :items_orders do |t|
      t.integer :item_id
      t.integer :designer_id
      t.integer :shopping_cart_id
      t.integer :order_id
    end
  end
end
