class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :buyer, null: false 
      t.string :description, null: false 
      t.decimal :price, precision: 8, scale: 2, null: false 
      t.integer :quantity, null: false 
      t.string :address, null: false 
      t.string :supplier, null: false 
      t.integer :batch_id, index: true

      t.timestamps null: false
    end
  end
end
