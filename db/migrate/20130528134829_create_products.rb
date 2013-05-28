class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :admin
      t.string :title
      t.text :description
      t.string :img_url
      t.decimal :price

      t.timestamps
    end
  end
end
