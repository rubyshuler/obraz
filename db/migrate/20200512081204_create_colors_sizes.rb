class CreateColorsSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :color
      t.integer :user_id

      t.timestamps
    end

    create_table :sizes do |t|
      t.string :size

      t.timestamps
    end
  end
end
