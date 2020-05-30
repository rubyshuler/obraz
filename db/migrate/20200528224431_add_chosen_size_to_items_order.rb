class AddChosenSizeToItemsOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :items_orders, :chosen_size, :string
  end
end
