class AddSizeToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :size, :integer
    add_column :items, :model_height, :integer
    add_column :items, :model_weight, :integer
    add_column :items, :details, :string, array: true
  end
end
