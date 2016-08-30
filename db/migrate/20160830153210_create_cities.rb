class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, limit: 100, null: false

      t.timestamps null: false
    end
    add_index :cities, :name, unique: true
  end
end
