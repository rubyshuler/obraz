class CreateDesigners < ActiveRecord::Migration[6.0]
  def change
    create_table :designers do |t|
      t.integer :role
      
      t.timestamps
    end
  end
end
