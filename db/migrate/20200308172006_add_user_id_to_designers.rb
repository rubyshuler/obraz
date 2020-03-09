class AddUserIdToDesigners < ActiveRecord::Migration[6.0]
  def change
    add_column :designers, :user_id, :integer
  end
end
