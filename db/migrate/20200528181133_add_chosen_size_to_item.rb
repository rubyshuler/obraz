class AddChosenSizeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :chosen_size, :string
  end
end
