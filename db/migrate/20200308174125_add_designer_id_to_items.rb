class AddDesignerIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :designer_id, :integer
  end
end
