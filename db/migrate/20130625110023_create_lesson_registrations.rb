class CreateLessonRegistrations < ActiveRecord::Migration
  def change
    create_table :lesson_registrations do |t|
      t.references :lesson
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :child_name
      t.integer :child_age
      t.boolean :photo_consent
      t.text :medical_info
      t.string :payment_method
      t.text :other_details
      t.integer :user_id

      t.timestamps
    end
    add_index :lesson_registrations, :lesson_id
  end
end
