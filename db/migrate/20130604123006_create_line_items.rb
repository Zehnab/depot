class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal :uni_price
      t.integer :quantity
      t.references :product
      
      t.timestamps
    end
  end
end
