class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :lesson
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :child_name
      t.string :child_age
      t.boolean :photo_consent
      t.text :medical_info
      t.string :payment_method

      t.timestamps
    end
    add_index :registrations, :lesson_id
  end
end
