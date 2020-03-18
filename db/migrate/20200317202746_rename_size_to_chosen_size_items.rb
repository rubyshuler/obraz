class RenameSizeToChosenSizeItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :size, :chosen_size
  end
end
