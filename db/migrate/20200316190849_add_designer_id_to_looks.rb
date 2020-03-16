class AddDesignerIdToLooks < ActiveRecord::Migration[6.0]
  def change
    add_column :looks, :designer_id, :integer
  end
end
