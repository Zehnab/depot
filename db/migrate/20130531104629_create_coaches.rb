class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.text :bio
      t.string :level

      t.timestamps
    end
  end
end
