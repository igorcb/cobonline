class AddStatusToAdvances < ActiveRecord::Migration
  def change
    add_column :advances, :status, :integer, null: false, default: 0
  end
end
