class CreateItemsLooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :items, :looks do |t|
      t.index [:item_id, :look_id]
      t.index [:look_id, :item_id]
    end
  end
end
