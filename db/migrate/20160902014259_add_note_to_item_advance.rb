class AddNoteToItemAdvance < ActiveRecord::Migration
  def change
    add_column :item_advances, :note, :string
  end
end
