class CreateAdvances < ActiveRecord::Migration
  def change
    create_table :advances do |t|
      t.references :client, index: true, foreign_key: true
      t.date :date_advance, null: false
      t.decimal :price, precision: 9, scale: 2, null: false
      #t.decimal :balance, precision: 9, scale: 2, null: false
      t.decimal :percent, precision: 9, scale: 2, null: false
      t.integer :number_parts, null: false

      t.timestamps null: false
    end
    add_index :advances, :date_advance
  end
end
