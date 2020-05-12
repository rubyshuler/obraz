class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :details
      t.integer :designer_id

      t.timestamps
    end

    create_table :looks do |t|
      t.string :name
      t.string :description
      t.string :details
      t.string :quote
      t.integer :stylist_id, foreign_key: true

      t.timestamps
    end

    create_table :messages do |t|
      t.string :body
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end

    create_table :orders do |t|
      t.json :address
      t.string :status
      t.integer :user_id
      t.integer :designer_id

      t.timestamps
    end

    create_table :shopping_carts do |t|
      t.integer :user_id

      t.timestamps
    end

    create_table :designers do |t|
      t.string :brand_name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
