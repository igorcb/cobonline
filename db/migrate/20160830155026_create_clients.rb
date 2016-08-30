class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :city, index: true, foreign_key: true
      t.string :name, limit: 100, null: false
      t.string :fone, limit: 20

      t.timestamps null: false
    end
  end
end
