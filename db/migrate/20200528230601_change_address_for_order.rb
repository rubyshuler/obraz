class ChangeAddressForOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :address, :string
  end
end
