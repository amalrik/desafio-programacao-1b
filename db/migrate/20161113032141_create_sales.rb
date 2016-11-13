class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :buyer
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity
      t.string :address 
      t.string :supplier
      t.integer :batch_id, index: true

      t.timestamps null: false
    end
  end
end
