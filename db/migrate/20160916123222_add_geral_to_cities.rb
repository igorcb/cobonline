class AddGeralToCities < ActiveRecord::Migration
  def change
    add_column :cities, :geral, :boolean, default: false
  end
end
