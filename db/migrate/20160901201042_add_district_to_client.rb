class AddDistrictToClient < ActiveRecord::Migration
  def change
    add_column :clients, :district, :string
  end
end
