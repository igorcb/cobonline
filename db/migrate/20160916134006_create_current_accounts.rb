class CreateCurrentAccounts < ActiveRecord::Migration
  def change
    create_table :current_accounts do |t|
      t.references :city, index: true, foreign_key: true
      t.references :cost, index: true, foreign_key: true
      t.date :date_ocurrence
      t.integer :type_launche
      t.decimal :price
      t.string :historic

      t.timestamps null: false
    end
  end
end
