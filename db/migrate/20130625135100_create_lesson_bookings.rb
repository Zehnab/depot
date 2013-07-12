class CreateLessonBookings < ActiveRecord::Migration
  def change
    create_table :lesson_bookings do |t|
      t.references :lesson_registration
      t.integer :quantity
      t.decimal :amount
      t.string :status

      t.timestamps
    end
    add_index :lesson_bookings, :lesson_registration_id
  end
end
