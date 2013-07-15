class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :banner_image
      t.string :b_name
      t.string :b_address
      t.string :b_email
      t.integer :b_tel
      t.string :useful_link_1
      t.string :useful_link_2
      t.string :useful_link_3

      t.timestamps
    end
  end
end
