class CreateItemAdvances < ActiveRecord::Migration
  def change
    create_table :item_advances do |t|
      t.references :advance, index: true, foreign_key: true
      t.string :parts
      t.date :due_date, null: false
      t.decimal :price, precision: 9, scale: 2, null: false
      t.date :date_payment
      t.decimal :value_payment
      t.decimal :dalay, precision: 9, scale: 2, null: false
      t.timestamps null: false
    end
  end
end
