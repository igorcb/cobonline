class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name, limite: 100, null: false
      t.date :date_holiday, null: false

      t.timestamps null: false
    end
    add_index :holidays, :date_holiday, unique: true
  end
end
