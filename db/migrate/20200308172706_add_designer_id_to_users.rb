class AddDesignerIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :designer_id, :integer
  end
end
