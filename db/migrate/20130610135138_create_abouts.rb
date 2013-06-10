class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :about_us
      t.text :vision
      t.text :history

      t.timestamps
    end
  end
end
