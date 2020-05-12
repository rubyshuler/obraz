class CreateItemQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :item_quantities do |t|
      t.references :size, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
